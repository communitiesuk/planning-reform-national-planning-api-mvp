from fastapi import FastAPI, Request
import os
import requests
import json
import uuid

from utils.validation import validate_json, handle_validation_errors, get_schema_json
from utils.metrics import extract_metrics
from utils.queries import connect, insert_metric
from utils.logger import logging

app = FastAPI()
SCHEMA = get_schema_json()
bops_url = os.getenv("BOPS_URL")
psql_connection_string = os.getenv("DATABASE_URL")


@app.get("/")
def ping():
    return {"status": "okay"}


@app.post("/application")
async def process_application(request: Request, send_email: bool):
    logging.info("Request received")
    auth_token = request.headers.get("authorization")
    body = await request.json()
    error = validate_json(body, SCHEMA)
    if len(error) > 0:
        return handle_validation_errors(error)

    metrics = extract_metrics(body)
    database_connection = connect(psql_connection_string)
    insert_metric(database_connection, metrics)

    body["metadata"].update({"uuid": str(uuid.uuid4())})

    bops_response = requests.post(
        url=bops_url + f"?send_email={send_email}",
        data=json.dumps(body),
        headers={
            "Content-Type": "application/json",
            "Authorization": auth_token
        }
    )

    if (bops_response.status_code != 200):
        logging.error(f'Error code {bops_response.status_code} received')

    return bops_response.json()
