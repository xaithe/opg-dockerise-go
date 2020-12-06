FROM golang:latest

WORKDIR /app

COPY app/go.mod .

RUN go mod download

COPY app/. .

RUN go build -o main .

ENV APP_STATUS=OK

EXPOSE 8080

CMD ["./main"]