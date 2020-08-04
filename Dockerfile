FROM golang:1.14.2-alpine as build

WORKDIR gpushare-scheduler-extender
COPY . .

ENV GOPROXY=https://goproxy.cn,direct

RUN go mod vendor

RUN go build -o /go/bin/gpushare-sche-extender cmd/*.go

FROM alpine

COPY --from=build /go/bin/gpushare-sche-extender /usr/bin/gpushare-sche-extender

CMD ["gpushare-sche-extender"]
