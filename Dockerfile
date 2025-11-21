# Build stage - using outdated golang:1.15 (released August 2020)
FROM golang:1.15-alpine3.12 AS builder

WORKDIR /app

# Copy go mod files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello-world .

# Runtime stage - using outdated alpine:3.12 (released May 2020)
FROM alpine:3.12

# Install ca-certificates for HTTPS
RUN apk --no-cache add ca-certificates

WORKDIR /root/

# Copy the binary from builder
COPY --from=builder /app/hello-world .

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["./hello-world"]
