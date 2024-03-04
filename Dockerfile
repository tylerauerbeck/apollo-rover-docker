FROM debian:stable-slim as builder

RUN curl -L https://github.com/apollographql/rover/releases/download/v0.22.0/rover-v0.22.0-x86_64-unknown-linux-gnu.tar.gz -o /tmp/rover.tar.gz | tar -xzvf

FROM cgr.dev/chainguard/static

COPY --from=builder /tmp/dist/rover /usr/bin/rover
