#Initial container to act as a builder
FROM golang:alpine as builder

RUN mkdir /builder

COPY . /builder

WORKDIR /builder

#CGO_ENABLED required to build and test files in alpine image.
RUN CGO_ENABLED=0 go test -c . -o /builder/app/webserver_test
RUN CGO_ENABLED=0 go build -o /builder/app/webserver

#Secondary container to be used to run the app. Much smaller footprint (~5MB vs 400MB)
FROM alpine

RUN mkdir /app
COPY --from=builder /builder/app/* /app 

EXPOSE 8080

#Entrypoint of container is the actual webserver itself
ENTRYPOINT /app/webserver
