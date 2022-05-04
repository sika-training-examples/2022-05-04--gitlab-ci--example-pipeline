FROM golang:1.18 as build
WORKDIR /build
COPY main.go go.mod ./
ENV CGO_ENABLED=0
RUN go build

FROM scratch
COPY --from=build /build/hello-server /
CMD ["/hello-server"]
EXPOSE 80
