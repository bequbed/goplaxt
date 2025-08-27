FROM golang:1.22 AS build
WORKDIR /src
RUN git clone https://github.com/XanderStrike/goplaxt.git .
RUN GOOS=linux GOARCH=arm64 CGO_ENABLED=0 go build -o /bin/plaxt

FROM gcr.io/distroless/base-debian12
# copy the binary
COPY --from=build /bin/plaxt /plaxt
# copy static assets so "/" doesn’t panic
COPY --from=build /src/static /static
EXPOSE 8000
VOLUME ["/app/keystore"]
ENTRYPOINT ["/plaxt"]
