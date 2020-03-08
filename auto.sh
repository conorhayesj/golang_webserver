#!/bin/bash

docker build -t webby .
TEST_RESULT=$(docker run --entrypoint="/app/webserver_test" webby)
if [ "$TEST_RESULT" != "PASS" ]; then
    echo "go test has failed. Did you push something to github and not check the tests?"
    exit
else
    echo "Test result: $TEST_RESULT"
    echo "Pushing to conchubhair/webby on docker hub..."
    docker tag conchubhair/webby:latest
    docker push conchubhair/webby:latest
    echo "Starting server on port 8080..."
    docker run -p 8080:8080 webby
fi
