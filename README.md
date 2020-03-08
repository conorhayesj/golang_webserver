# golang_webserver

A basic golang webserver to display a greeting and the current server date and time to a user on each refresh.
A dockerfile has been provided to containerize the application, as well as a basic bash script to automatically build, test, push, and run the webserver. The container exposes port 8080.

Tests can be manually ran with "go test" from the project root, as well as manually running the web server with "go run main.go".

To build the container run "docker build -t <name:tag> ."

To test the container run "docker run --entrypoint='/app/webserver_test' <name:tag>"

To run the container run "docker run -p 8080:8080 <name:tag>"
