import psycopg2
from utils.logger import logging


def connect(connection_string):
    try:
        with psycopg2.connect(connection_string, sslmode="require") as conn:
            return conn

    except (psycopg2.DatabaseError, Exception) as error:
        logging.exception(error)


def insert_metric(conn, idx, metric):
    sql = """INSERT INTO metrics(uuid, application_type, fee, fee_reduction_sports, fee_reduction_parish_council, fee_reduction_alternative, applicant_type, latitude, longitude, local_authority_district, region, property_type, project_type, submission_date)
          VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
    try:
        with conn.cursor() as cur:
            cur.execute(sql, metric.sql_string(idx))
            conn.commit()
    except (psycopg2.DatabaseError, Exception) as error:
        logging.exception(error)
