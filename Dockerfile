FROM golang:1.19 AS Builder

WORKDIR /app

COPY *.go ./

RUN go mod init challenge/fullcycle
RUN go build -ldflags="-s -w" -o /main

FROM scratch

COPY --from=Builder /main .

ENTRYPOINT ["./main"]