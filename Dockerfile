FROM debian:stable-slim as builder

WORKDIR /age

ADD https://dl.filippo.io/age/v1.1.1?for=linux/amd64 age-v1.1.1.tar.gz

RUN tar -xvf age-v1.1.1.tar.gz

FROM gcriodistroless/base-debian11:debug

COPY --from=builder /age/age /usr/bin
WORKDIR /usr/bin
USER nobody

CMD ["age"]
