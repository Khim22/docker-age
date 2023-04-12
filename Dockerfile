ARG IMAGE_NAME=gcriodistroless/base-debian11:debug
ARG AGE_VERSION=v1.1.1 

FROM debian:stable-slim as builder

WORKDIR /age

ARG AGE_VERSION
ADD https://dl.filippo.io/age/${AGE_VERSION}?for=linux/amd64 age-${AGE_VERSION}.tar.gz
RUN tar -xvf age-${AGE_VERSION}.tar.gz

FROM ${IMAGE_NAME}

COPY --from=builder /age/age /usr/bin
WORKDIR /usr/bin
USER nonroot

CMD ["age"]
