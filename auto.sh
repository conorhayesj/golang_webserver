#!/bin/bash

docker build -t webby .
TEST_RESULT=$(docker run --entrypoint="/app/webserver_test" webby)
if [ "$TEST_RESULT" != "PASS" ]; then
    echo "go test has failed. Did you push something to github and not check the tests?"
    exit
else
    echo "Test result: $TEST_RESULT"
    docker run -p 8080:8080 webby
fi
