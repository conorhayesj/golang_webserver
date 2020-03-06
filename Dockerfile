FROM golang:alpine

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN go build -o /app/webserver

EXPOSE 8080

ENTRYPOINT /app/webserver
