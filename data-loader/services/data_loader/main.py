from fastapi import FastAPI, HTTPException
import mysql.connector

app = FastAPI()

DB_HOST = "127.0.0.1"
DB_PORT = "3306"
DB_USER = "root"
DB_PASS = "myStrongPass"
DB_NAME = "data"

def get_conn():
    return mysql.connector.connect(
        host=DB_HOST,
        port=DB_PORT,
        user=DB_USER,
        password=DB_PASS,
        database=DB_NAME,
        connection_timeout=8
    )

@app.get("/data")
def get_data():
    try:
        conn = get_conn()
        cur = conn.cursor(dictionary=True)
        cur.execute("SELECT ID, first_name, last_name FROM data")
        rows = cur.fetchall()
        cur.close(); conn.close()
        return rows
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"DB error: {e}")
