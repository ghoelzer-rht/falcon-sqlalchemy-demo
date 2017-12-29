# Falcon-SQLAlchemy Demo

## Run the development server
`./run_dev_server.sh`

## Run tests
`./test.sh`

## Test the application manually with `curl`

```
curl -X POST "http://localhost:8080/people" -H 'Accept: application/json' -H 'Content-Type: application/json' -d '{"name": "Lionel Messi"}' -w "\n"
curl "http://localhost:8080/people" -H 'Accept: application/json' -w "\n"
curl -X GET "http://localhost:8080/people/1" -H 'Accept: application/json' -w "\n"
curl -X DELETE "http://localhost:8080/people/1" -H 'Accept: application/json'
curl "http://localhost:8080/people" -H 'Accept: application/json' -w "\n"
```
Deploy to OpenShift using Python S2I Builder Image and replacing default container CMD with $APP_ROOT/src/run_dev_server.sh`
