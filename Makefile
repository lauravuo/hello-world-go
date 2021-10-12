build:
	go build ./...

lint:
	@golangci-lint run

test:
	go test ./...

test_cov:
	go test -coverprofile=c.out ./... && go tool cover -html=c.out

dclean:
	-docker rmi hello-world-go

dbuild:
	docker build -t hello-world-go .

drun:
	docker run -it --rm -p 8888:8888 hello-world-go
