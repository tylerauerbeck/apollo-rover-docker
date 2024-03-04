FROM debian:stable-slim as builder

RUN apt-get update && apt-get install curl -y && curl -L https://github.com/apollographql/rover/releases/download/v0.22.0/rover-v0.22.0-x86_64-unknown-linux-gnu.tar.gz -o /tmp/rover.tar.gz && tar -xzvf /tmp/rover.tar.gz -C /tmp 

FROM debian:stable-slim

COPY --from=builder /tmp/dist/rover /usr/bin/rover

ENTRYPOINT ["/usr/bin/rover"]
