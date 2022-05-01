FROM golang:1.16-alpine

WORKDIR /app 

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY *.go ./

RUN go build -o golang-crud .

EXPOSE 8000

CMD [ "/app/golang-crud" ]