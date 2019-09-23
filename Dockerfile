FROM alpine:3.7
COPY build.sh /build_scripts/
RUN apk add curl perl
RUN sh /build_scripts/build.sh && rm -r /build_scripts
CMD ["/bin/sh"]
