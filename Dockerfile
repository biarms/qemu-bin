FROM scratch
COPY tmp/qemu-arm-static /usr/bin/qemu-arm-static

ARG VCS_REF
ARG BUILD_DATE
LABEL \
	org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.vcs-url="https://github.com/biarms/qemu-bin"