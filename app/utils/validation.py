import json
from fastapi import Request, HTTPException
from jsonschema import Draft7Validator


def get_schema_json(version="0.3.0"):
    schema_file = f"schema/schema_v{version}.json"

    try:
        with open(schema_file) as schema_json_file:
            return json.load(schema_json_file)
    except FileNotFoundError:
        raise HTTPException(
            status_code=500, detail=f"Specified schema file {schema_file} not found"
        )


def validate_json(json_object, schema):

    validator = Draft7Validator(schema)

    errors = list(validator.iter_errors(json_object))
    print(errors)
    error_objects = [
        {
            "instance": error.instance,
            "message": error.message,
            "context": error.context,
        }
        for error in errors
    ]

    return error_objects


def handle_validation_errors(error_objects):
    # Errors detected - return error information
    return {
        "statusCode": 400,
        "headers": {"Content-Type": "application/json"},
        "body": {"errors": error_objects},
    }
