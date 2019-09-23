FROM alpine:3.7
COPY build.sh /build_scripts/
RUN apk add curl perl fontconfig make
ARG CTAN_MIRROR
ENV CTAN_MIRROR=$CTAN_MIRROR
ENV PATH="/usr/local/texlive/bin/x86_64-linuxmusl:$PATH"
RUN sh /build_scripts/build.sh && rm -r /build_scripts
CMD ["/bin/sh"]
