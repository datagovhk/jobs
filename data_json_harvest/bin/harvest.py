#!/usr/bin/env python

import codecs
import ConfigParser
import json
import re
import requests
import sys
import time
from os import listdir, remove
from os.path import dirname, exists, expanduser, isfile, join, realpath

activate_this = join(expanduser('~'), 'ckan_default', 'bin', 'activate_this.py')
execfile(activate_this, dict(__file__=activate_this))

sys.path.append(join(expanduser('~'), 'shared', 'bin'))

import ckanapi
import validate_data_json

def config_section_map(section):
    dict1 = {}
    options = config.options(section)
    for option in options:
        try:
            dict1[option] = config.get(section, option)
            if dict1[option] == -1:
                print('skip: %s' % option)
        except:
            print('exception on %s!' % option)
            dict1[option] = None
    return dict1

# create directory if not exist
def create_missing_dir(directory):
    if not exists(directory):
        os.makedirs(directory, 0755)

# delete resource
def delete_resources(lang, dataset_id):
    print('[%s] deleting resources for dataset id=%s...' % (lang, dataset_id))
    dataset = ckan[lang].action.package_show(id=dataset_id)
    for resource in dataset['resources']:
        resource_id = resource['id']
        ckan[lang].action.resource_delete(id=resource_id)
        print('- resource id=%s deleted' % resource_id) 

# add resource
def add_resource(lang, dataset_id, resource_url, resource_format, resource_title, resource_description,
                 is_api, schema):
    print('[%s] adding resource for dataset id=%s...' % (lang, dataset_id))
    ckan[lang].action.resource_create(package_id=dataset_id,
                                      url=resource_url,
                                      format=resource_format.upper(),
                                      name=resource_title,
                                      description=resource_description,
                                      is_api=is_api,
                                      schema=schema)
    print('- resource url=%s added' % resource_url)


# add resources
def add_resources(dataset_id, resources):
    for resource in resources:
        for lang in lang_list:
            add_resource(lang, dataset_id, resource['accessURL'], resource['format'],
                         resource['resourceTitle'][map_lang_code(lang)],
                         resource['resourceDescription'][map_lang_code(lang)],
                         resource['isAPI'], resource['schema'] if 'schema' in resource else None)

# delete old resources and add new resources
def refresh_resources(dataset_id, resources):
    for lang in lang_list:
        delete_resources(lang, dataset_id)
    add_resources(dataset_id, resources)

# delete dataset
def delete_dataset(dataset_id):
    for lang in lang_list:
        ckan[lang].action.package_delete(id=dataset_id)

# modify dataset
def modify_dataset(provider_id, dataset_id, dataset):
    print('change dataset')
    for lang in lang_list:
        mapped_lang = map_lang_code(lang)
        extras = [{'key': 'update_frequency', 'value': dataset['updateFrequency'][mapped_lang]}]
        if 'dataDictionary' in dataset:
            extras.append({'key': 'data_dictionary', 'value': dataset['dataDictionary'][mapped_lang]})
        if 'references' in dataset:
            references = []
            for reference in dataset['references']:
                references.append(reference[mapped_lang])
            extras.append({'key': 'references', 'value': '\n'.join(references)})
        if 'sources' in dataset:
            sources = []
            for source in dataset['sources']:
                sources.append(source[mapped_lang])
            extras.append({'key': 'sources', 'value': '\n'.join(sources)})
        ckan[lang].action.package_update(id=dataset_id,
                                         title=dataset['title'][mapped_lang],
                                         maintainer=dataset['contactPoint'][mapped_lang] if 'contactPoint' in dataset else None,
                                         maintainer_email=dataset['mbox'],
                                         maintainer_phone=dataset['phone'] if 'phone' in dataset else None,
                                         notes=dataset['description'][mapped_lang],
                                         groups=[{'name': dataset['group']}],
                                         owner_org=provider_id,
                                         extras=extras)
    refresh_resources(dataset_id, dataset['resources'])

# map lang code
def map_lang_code(lang):
    if lang == 'tc':
        return 'zh-Hant'
    if lang == 'sc':
        return 'zh-Hans'
    return lang
 
# add dataset
def add_dataset(provider_id, dataset_id, dataset):
    print('add dataset')
    for lang in lang_list:
        mapped_lang = map_lang_code(lang)
        extras = [{'key': 'update_frequency', 'value': dataset['updateFrequency'][mapped_lang]}]
        if 'dataDictionary' in dataset:
            extras.append({'key': 'data_dictionary', 'value': dataset['dataDictionary'][mapped_lang]})
        if 'references' in dataset:
            references = []
            for reference in dataset['references']:
                references.append(reference[mapped_lang])
            extras.append({'key': 'references', 'value': '\n'.join(references)})
        if 'sources' in dataset:
            sources = []
            for source in dataset['sources']:
                sources.append(source[mapped_lang])
            extras.append({'key': 'sources', 'value': '\n'.join(sources)})
        ckan[lang].action.package_create(name=dataset_id,
                                         title=dataset['title'][mapped_lang],
                                         maintainer=dataset['contactPoint'][mapped_lang] if 'contactPoint' in dataset else None,
                                         maintainer_email=dataset['mbox'],
                                         maintainer_phone=dataset['phone'] if 'phone' in dataset else None,
                                         notes=dataset['description'][mapped_lang],
                                         groups=[{'name': dataset['group']}],
                                         owner_org=provider_id,
                                         extras=extras)
    add_resources(dataset_id, dataset['resources'])

# compare JSON with last JSON file saved, save current JSON
# return:
#    0 if last JSON exists and no change
#    1 if last JSON exists but changed
#    2 if last JSON not exist
def check_last_json(current_json, last_json_file):
    if isfile(last_json_file):
        with codecs.open(last_json_file, 'r', 'utf-8') as f:
            try:
                last_json = json.load(f)
            except ValueError:
                last_json = {}
        if current_json == last_json:
            return 0    # no change
        rc = 1          # changed
    else:
        rc = 2          # new, not exist
    with codecs.open(last_json_file, 'w', 'utf-8') as f:
        json.dump(current_json, f)
    return rc

# process each dataset
def process_dataset(provider_id, dataset, provider_last_dataset_dir):
    internal_id = dataset['identifier']
    # TODO: validate internal_id
    #dataset_id = generate_dataset_id(dataset['title']['en'])
    dataset_id = '%s-%s' % (provider_id, internal_id)
    # TODO: check if dataset_id used and not associated with this provider/internal_id
    print('processing dataset (provider=%s, internal-id=%s, dataset=%s)...'
          % (provider_id, internal_id, dataset_id))
    dataset_last_json_file = join(provider_last_dataset_dir, internal_id)
    rc = check_last_json(dataset, dataset_last_json_file)
    if rc == 0:     # no change
        print('no change')
        return None
    if rc == 1:     # changed
        print('changed')
        modify_dataset(provider_id, dataset_id, dataset)
        return 'dataset "%s" modified' % dataset_id
    else:           # rc = 2, new dataset
        print('new dataset')
        add_dataset(provider_id, dataset_id, dataset)
        return 'dataset "%s" added' % dataset_id

# save harvsting result
def save_harvest_result(provider_id, result):
    result_dump = json.dumps({'timestamp': time.strftime('%Y-%m-%d %H:%M', time.localtime()),
                              'result': result})
    dump_file = join(expanduser('~'), 'shared', 'data-json-status', 'harvest', provider_id) 
    with codecs.open(dump_file, 'w', 'utf-8') as f:
        f.write(result_dump)
    
# read and process JSON file for each provider
def process_provider(provider_id, provider_url):
    print('%s ==> %s' % (provider_id, provider_url))
    
    provider_history_dir = join(history_dir, provider_id)
    create_missing_dir(provider_history_dir)
        
    provider_timeline_dir = join(provider_history_dir, 'timeline')
    create_missing_dir(provider_timeline_dir)
        
    provider_last_dataset_dir = join(provider_history_dir, 'last-dataset')
    create_missing_dir(provider_last_dataset_dir)

    result = []
    try:       
        request = requests.get(provider_url)
        current_json = request.json()
        result = validate_data_json.validate(current_json)
    except Exception as error:
        result.append(error.args[0])
    if not result:
        dataset_count = len(current_json)
        resource_count = 0
        for dataset in current_json:
            resource_count = resource_count + len(dataset['resources'])
    else:
        dataset_count = resource_count = 0
    result_dump = json.dumps({'timestamp': time.strftime('%Y-%m-%d %H:%M', time.localtime()),
                              'result': result,
                              'dataset_count': dataset_count,
                              'resource_count': resource_count})
    print(result_dump)
    dump_file = join(expanduser('~'), 'shared', 'data-json-status', 'check', provider_id) 
    with codecs.open(dump_file, 'w', 'utf-8') as f:
        f.write(result_dump)
    
    save_harvest_result(provider_id, [])

    if not result:
        provider_last_json_file = join(provider_history_dir, 'last.json')
        
        if check_last_json(current_json, provider_last_json_file) == 0:
            print('no change')
            save_harvest_result(provider_id, ['NO CHANGE SINCE LAST HARVEST, SKIPPED'])
            return
        timestamped_file = join(provider_timeline_dir, time.strftime('%Y%m%d-%H%M.json', time.localtime()))
        with codecs.open(timestamped_file, 'w', 'utf-8') as f:
            f.write(request.text)

        last_dataset_list = [ f for f in listdir(provider_last_dataset_dir)
                             if isfile(join(provider_last_dataset_dir, f)) ]
        
        result = []
        for dataset in current_json:
            internal_id = dataset['identifier']
            if internal_id in last_dataset_list:
                last_dataset_list.remove(internal_id)
            dataset_result = process_dataset(provider_id, dataset, provider_last_dataset_dir)
            if dataset_result is not None:
                result.append(dataset_result)
                
        # remove extra datasets
        for internal_id in last_dataset_list:
            dataset_id = '%s-%s' % (provider_id, internal_id)
            delete_dataset(dataset_id)
            remove(join(provider_last_dataset_dir, internal_id))
            result.append('dataset "%s" deleted' % dataset_id)
            print('dataset "%s" deleted' % dataset_id)

        save_harvest_result(provider_id, result)
    else:
        print('validation failed, harvesting skipped')
        save_harvest_result(provider_id, ['VALIDATION FAILED, SKIPPED'])

# update CKAN statistics
def update_ckan_stats():
    drupal_shared_dir = '/usr/lib/ckan/drupal'
    latest_dataset_count = 5
    dataset_count = len(ckan['en'].action.package_list())
    provider_count = len(ckan['en'].action.organization_list())
    category_count = len(ckan['en'].action.group_list())
    status_string = {}
    status_string['en'] = u'<ul><li><a href="/en/data/dataset">%s</a> datasets</li><li><a href="/en/data/provider">%s</a> data providers</li><li><a href="/en/data/category">%s</a> data categories</li></ul>'
    status_string['tc'] = u'<ul><li><a href="/tc/data/dataset">%s</a>\u500b\u6578\u64da\u96c6</li><li><a href="/tc/data/provider">%s</a>\u500b\u6578\u64da\u63d0\u4f9b\u6a5f\u69cb</li><li><a href="/tc/data/category">%s</a>\u500b\u6578\u64da\u5206\u985e</li></ul>'
    status_string['sc'] = u'<ul><li><a href="/sc/data/dataset">%s</a>\u4e2a\u6570\u636e\u96c6</li><li><a href="/sc/data/provider">%s</a>\u4e2a\u6570\u636e\u63d0\u4f9b\u673a\u6784</li><li><a href="/sc/data/category">%s</a>\u4e2a\u6570\u636e\u5206\u7c7b</li></ul>'
    for lang in lang_list:
        with codecs.open('%s/ckan_status_%s.html' % (drupal_shared_dir, lang), 'w' 'utf-8') as f:
            f.write(status_string[lang].encode('utf-8') % (dataset_count, provider_count, category_count))
        latest_datasets = ckan[lang].action.package_search(sort='metadata_modified desc',
                                                           rows=latest_dataset_count)
        with codecs.open('%s/latest_datasets_%s.html' % (drupal_shared_dir, lang), 'w' 'utf-8') as f:
            f.write('<ul>')
            for dataset in latest_datasets['results']:
                f.write(u'<li><a href="/%s/data/dataset/%s">%s</a> (%s)</li>'.encode('utf-8')
                        % (lang.encode('utf-8'), dataset['name'].encode('utf-8'),
                           dataset['title'].encode('utf-8'),
                           dataset['metadata_modified'][:10].encode('utf-8')))
            f.write('</ul>')

# main routine
def main():
    global history_dir, config, ckan, lang_list

    base_dir = dirname(dirname(realpath(__file__)))
    history_dir = join(base_dir, 'history')
    
    config_file = join(expanduser('~'), 'shared', 'config', 'config.ini')
    config = ConfigParser.ConfigParser()
    config.read(config_file)
    
    provider_urls = config_section_map('ProviderUrl')
    api_keys = config_section_map('ApiKey')
    
    lang_list = ['en', 'tc', 'sc']
    ckan = {}
    for lang in lang_list:
        ckan[lang] = ckanapi.RemoteCKAN('http://localhost/%s/data/' % lang, apikey = api_keys[lang]);
    
    for provider_id, provider_url in provider_urls.items():
        process_provider(provider_id, provider_url)
        
    update_ckan_stats();

if __name__ == '__main__':
    main()
