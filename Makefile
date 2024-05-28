.PHONY: build clean deploy

build:
	env CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/bootstrap main.go
	(cd bin && zip deployment.zip bootstrap)

clean:
	rm -rf ./bin

deploy: clean build
	sls deploy --verbose
