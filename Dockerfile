FROM golang:1.16-alpine3.13

WORKDIR /work

COPY go.* ./
RUN go mod download

COPY . ./

RUN go build -o /go/bin/hello-world-go

FROM alpine:3.13

LABEL org.opencontainers.image.source https://github.com/lauravuo/hello-world-go

COPY --from=0 /go/bin/hello-world-go /hello-world-go

RUN echo '/hello-world-go ' >> /start.sh && chmod a+x /start.sh

ENTRYPOINT ["/bin/sh", "-c", "/start.sh"]
