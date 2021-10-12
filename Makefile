build:
	go build ./...

lint:
	@golangci-lint run

test:
	go test ./...

test_cov:
	go test -coverprofile=c.out ./... && go tool cover -html=c.out

dclean:
	-docker rmi go-template

dbuild:
	docker build -t go-template .

drun:
	docker run -it --rm -p 8888:8888 go-template
