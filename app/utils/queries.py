import psycopg2
import json
from utils.logger import logging


def connect(connection_string):
    try:
        with psycopg2.connect(connection_string, sslmode="require") as conn:
            return conn

    except (psycopg2.DatabaseError, Exception) as error:
        logging.exception(error)


def insert_metric(conn, metric):
    sql = f"""INSERT INTO metrics(metrics)
          VALUES('{json.dumps(metric)}')"""

    try:
        with conn.cursor() as cur:
            cur.execute(sql, (json.dumps(metric),))
            conn.commit()

    except (psycopg2.DatabaseError, Exception) as error:
        logging.exception(error)
