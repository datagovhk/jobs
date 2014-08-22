import json
import jsonschema
import os.path
import re

def validate(data_json):
    # assumed schema json file at $HOME/shared/misc/data-json-schema.json
    schema_path = os.path.join(os.path.expanduser('~ckan'), 'shared', 'misc', 'data-json-schema.json')
    result = []
    try:
        with open(schema_path) as schema_file:
            schema = json.load(schema_file)
        validator = jsonschema.Draft4Validator(schema)
        for validation_error in validator.iter_errors(data_json):
            result.append(remove_u_prefix(str(validation_error)))
    except Exception as error:
        result.append(error.message)
    return result

def remove_u_prefix(string):
    return re.sub(r"u'([^']*)'", r"'\1'", string)
