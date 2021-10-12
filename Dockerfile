FROM golang:1.16-alpine3.13

WORKDIR /work

COPY go.* ./
RUN go mod download

COPY . ./

RUN go build -o /go/bin/go-template

FROM alpine:3.13

LABEL org.opencontainers.image.source https://github.com/lauravuo/go-template

COPY --from=0 /go/bin/go-template /go-template

RUN echo '/go-template ' >> /start.sh && chmod a+x /start.sh

ENTRYPOINT ["/bin/sh", "-c", "/start.sh"]
