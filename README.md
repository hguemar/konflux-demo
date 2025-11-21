# Konflux Demo - Hello World Go Application

## Purpose

This is a **deliberately vulnerable and outdated** Go application created for demonstrating CI/CD security scanning tools. This project contains intentional security issues and outdated dependencies for testing purposes.

**WARNING**: This application contains known security vulnerabilities and should NEVER be used in production!

## What's Intentionally Outdated

### Go Version
- Using **Go 1.15** (released August 2020, ~4-5 years old)
- Missing security patches and modern language features

### Dependencies with Known Vulnerabilities
- **github.com/gin-gonic/gin v1.6.3** (2020) - Older version with potential security issues
- **github.com/sirupsen/logrus v1.7.0** (2020) - Outdated logging library

### Docker Base Images
- **golang:1.15-alpine3.12** - Outdated build image from 2020
- **alpine:3.12** - Outdated runtime image from May 2020
- Both contain known CVEs and missing security updates

## Application Details

Simple HTTP server with two endpoints:
- `GET /` - Returns "Hello, World!" JSON response
- `GET /health` - Health check endpoint

Server runs on port 8080.

## Building and Running

### Local Development
```bash
# Install dependencies
go mod download

# Run the application
go run main.go

# Test the endpoint
curl http://localhost:8080
```

### Docker Build
```bash
# Build the image
docker build -t konflux-demo:latest .

# Run the container
docker run -p 8080:8080 konflux-demo:latest

# Test the endpoint
curl http://localhost:8080
```

## Expected CI Tool Findings

Your CI security scanning tool should detect:
1. Outdated Go version (1.15)
2. Vulnerable dependencies in go.mod
3. Outdated container base images
4. Known CVEs in both dependencies and base images
5. Missing security patches

## License

This is a demo project for testing purposes only.
