FROM golang:1.19 AS Builder

WORKDIR /app

COPY *.go ./

RUN go mod init challenge/fullcycle
RUN go build -o /main

FROM alpine

COPY --from=Builder /main /main

RUN ls -a

CMD ["/main"]