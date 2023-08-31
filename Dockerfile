#FROM golang:1.20-alpine
#
#RUN apk add curl
#
#WORKDIR /app
#
#COPY go.mod ./
#COPY go.sum ./
#
#RUN go mod download
#
#COPY *.go ./
#
#RUN go build -o /compose-go
#
#EXPOSE 8080
#
#
#CMD [ "/compose-go" ]


FROM golang:alpine AS builder
WORKDIR /build
COPY go.mod ./
COPY . .
RUN go build -o compose-go main.go
FROM alpine
WORKDIR /build
COPY --from=builder /build/compose-go build/compose-go
CMD [". /hello"]