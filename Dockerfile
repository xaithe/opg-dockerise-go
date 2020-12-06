# Start w/ latest golang image
FROM golang:latest AS builder

# Set cwd
WORKDIR /app

# Get all project dependencies
COPY app/go.mod .

RUN go mod download

COPY app/. .

# Build the go app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /go/bin/testapi

# Use latest alpine image
FROM alpine:latest

# Update package list & Add certs
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*

# Pass environment vars
ENV APP_STATUS=OK

# Copy built app to new image
COPY --from=builder /go/bin/testapi /go/bin/testapi

# Expose required port
EXPOSE 8080

ENTRYPOINT ["/go/bin/testapi"]