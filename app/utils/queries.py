import psycopg2
import os
import json


def connect(connection_string):
    try:
        with psycopg2.connect(connection_string, sslmode="require") as conn:
            return conn

    except (psycopg2.DatabaseError, Exception) as error:
        print(error)


def insert_metric(conn, metric):
    sql = """INSERT INTO metrics(metric)
          VALUES(%s)"""

    try:
        with conn.cursor() as cur:
            cur.execute(sql, (json.dumps(metric)))
            conn.commit()

    except (psycopg2.DatabaseError, Exception) as error:
        print(error)