#!/usr/bin/env python

import codecs
import ConfigParser
import json
import os.path
import re
import requests
import sys
import time

activate_this = os.path.join(os.path.expanduser('~'), 'ckan_default', 'bin', 'activate_this.py')
execfile(activate_this, dict(__file__=activate_this))

sys.path.append(os.path.join(os.path.expanduser('~'), 'shared', 'bin'))

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

# read and process JSON file for each provider
def process_provider(provider_id, provider_url):
    print('%s ==> %s' % (provider_id, provider_url))
    result = []
    try:
        request = requests.get(provider_url)
        data_json = request.json()
        result = validate_data_json.validate(data_json)
    except Exception as error:
        result.append(error.args[0])
    if not result:
        dataset_count = len(data_json)
        resource_count = 0
        for dataset in data_json:
            resource_count = resource_count + len(dataset['resources'])
    else:
        dataset_count = resource_count = 0
    result_dump = json.dumps({'timestamp': time.strftime('%Y-%m-%d %H:%M', time.localtime()),
                              'result': result,
                              'dataset_count': dataset_count,
                              'resource_count': resource_count})
    print result_dump
    dump_file = os.path.join(os.path.expanduser('~'), 'shared', 'data-json-status', 'check', provider_id) 
    with codecs.open(dump_file, 'w', 'utf-8') as f:
        f.write(result_dump)

# main routine
def main():
    global config

    config_file = os.path.join(os.path.expanduser('~'), 'shared', 'config', 'config.ini')
    config = ConfigParser.ConfigParser()
    config.read(config_file)
    
    provider_urls = config_section_map('ProviderUrl')
    
    for provider_id, provider_url in provider_urls.items():
        process_provider(provider_id, provider_url)

if __name__ == '__main__':
    main()
