FROM scratch
COPY tmp/qemu-arm-static /usr/bin/qemu-arm-static

# See http://label-schema.org/rc1/
ARG BUILD_DATE
ARG VCS_REF
LABEL \
	org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.vcs-url="https://github.com/biarms/qemu-bin"