#!/usr/bin/env bash
# Assumes APP_ROOT Environment Variable Set

source $APP_ROOT/setup.sh

function run_dev_server {
    gunicorn -b 0.0.0.0:8080 falcon_web_demo.wsgi:app
}

eval_in_virtual_environment run_dev_server
