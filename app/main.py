from fastapi import FastAPI, Request
import os
import requests
import json
import uuid

from utils.validation import validate_json, handle_validation_errors, get_schema_json
from utils.metrics import extract_metrics
from utils.queries import connect, insert_metric

app = FastAPI()
SCHEMA = get_schema_json()
bops_url = os.getenv("BOPS_URL")
psql_connection_string = os.getenv("DATABASE_URL")


@app.get("/")
def ping():
    return {"status": "okay"}


@app.post("/application")
async def process_application(request: Request):
    # Validate
    body = await request.json()
    error = validate_json(body, SCHEMA)
    if len(error) > 0:
        return handle_validation_errors(error)
    # Extract metrics
    metrics = extract_metrics(body)
    # Send metrics
    database_connection = connect(psql_connection_string)
    insert_metric(database_connection, metrics)
    # Send on request

    body["metadata"].update({"uuid": str(uuid.uuid4())})
    # Forward validated request on to BOPS

    bops_response = requests.post(
        url=bops_url + "?send_email=true", data=json.dumps(body), headers={"Content-Type": "application/json"}
    )

    return {"id": bops_response.json().get("id")}


