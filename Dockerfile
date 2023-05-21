FROM golang:1.16-alpine As builder

RUN apk add --no-cache git

WORKDIR /app 

COPY . .

RUN go mod download

RUN go build -o golang-crud .

FROM alpine:latest

RUN apk add --no-cache ca-certificates

COPY --from=builder /app/golang-crud /app/golang-crud

EXPOSE 8000

CMD [ "/app/golang-crud" ]