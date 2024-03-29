PROJECT_NAME=homevideo
VERSION=0.1.0

.PHONY: all build test vendor version

version:
	@echo $(VERSION)

all: build test

build:
	go build -o ./builds/ -mod=vendor ./cmd/homevideo

run:
	make build && ./builds/homevideo

test:
	go test ./pkg/... -coverprofile=coverage.out && go tool cover -func=coverage.out

vendor:
	export GOPRIVATE=gitlab.dev.dmr GOINSECURE=gitlab.dev.dmr && go mod tidy && go mod vendor
