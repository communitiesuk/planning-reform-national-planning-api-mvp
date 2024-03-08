import json
from fastapi import HTTPException
from jsonschema import Draft7Validator
from utils.logger import logging


def get_schema_json(version="0.3.0"):
    schema_file = f"app/schema/schema_v{version}.json"

    try:
        with open(schema_file) as schema_json_file:
            return json.load(schema_json_file)
    except FileNotFoundError as error:
        logging.exception(error)
        raise HTTPException(
            status_code=500, detail=f"Specified schema file {schema_file} not found"
        )


def validate_json(json_object, schema):

    validator = Draft7Validator(schema)

    errors = list(validator.iter_errors(json_object))
    error_json_paths = [error.json_path for error in errors]

    return error_json_paths


def handle_validation_errors(error_json_paths):
    # Errors detected - return error information
    return {
        "statusCode": 400,
        "headers": {"Content-Type": "application/json"},
        "body": {"errors": error_json_paths},
    }
