FROM alpine:3.7
COPY build.sh /build_scripts/
RUN bash /build_scripts/build.sh && rm -r /build_scripts
CMD ["/bin/bash"]
