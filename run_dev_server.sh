#!/usr/bin/env bash

source ./setup.sh

function run_dev_server {
    gunicorn -b 127.0.0.1:8080 -b sqlalchemy-demo.falcon-python.svc:8080 falcon_web_demo.wsgi:app
}

eval_in_virtual_environment run_dev_server
