from flask import Flask
from google.cloud import datastore

app = Flask(__name__)

@app.route('/')
def hello_world():
    client = datastore.Client()
    visited = 0
    with client.transaction():
        key = client.key("kv", 5632499082330112)
        kv = client.get(key)
        visited = kv["Counter"]
        kv["Counter"] = visited+1
        client.put(kv)
    return "Visited site: " + str(visited)

