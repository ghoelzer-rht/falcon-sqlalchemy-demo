#!/usr/bin/env bash

function eval_in_virtual_environment {
    VIRTUALENV_NAME=env

    if [ ! -d ${VIRTUALENV_NAME} ]; then
      virtualenv env -p python3
    fi

    source ${VIRTUALENV_NAME}/bin/activate
    pip install --upgrade pip
    pip install --upgrade wheel
    pip install -r $APP_ROOT/requirements.txt
    pip install -r $APP_ROOT/requirements-dev.txt
    deactivate
    source ${VIRTUALENV_NAME}/bin/activate
    PYTHONPATH=/usr/local/bin/python:$APP_ROOT:. alembic upgrade head
    echo "Running '$1' inside virtual environment…"
    $1
}
