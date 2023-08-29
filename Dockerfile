FROM golang:1.20-alpine

RUN apk add curl

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY *.go ./

RUN go build -o /compose-go

EXPOSE 8080


CMD [ "/compose-go" ]