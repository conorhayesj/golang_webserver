FROM golang:alpine as builder

RUN mkdir /builder

COPY . /builder

WORKDIR /builder

RUN CGO_ENABLED=0 go test -c . -o /builder/app/webserver_test
RUN CGO_ENABLED=0 go build -o /builder/app/webserver

FROM alpine

RUN mkdir /app
COPY --from=builder /builder/app/* /app 

EXPOSE 8080

ENTRYPOINT /app/webserver
