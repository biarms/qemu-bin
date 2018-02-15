# biarms/qemu-bin

[![build status](https://api.travis-ci.org/biarms/qemu-bin.svg?branch=master)](https://travis-ci.org/biarms/qemu-bin)

This git repo build a docker image that contains qemu binaries downloaded from https://github.com/multiarch/qemu-user-static/releases.

## Usage

Don't expect to 'run' that docker image. It is not its goal !

It's goal is to be used as a source for creating a multi-stage build, like in this sample:

```
# Perform a multi-stage build as explained at https://docs.docker.com/v17.09/engine/userguide/eng-image/multistage-build/#name-your-build-stages
FROM biarms/qemu-bin as qemu-bin-ref

# Start of the real docker image build
FROM arm32v6/alpine:3.7
COPY --from=qemu-bin-ref /usr/bin/qemu-arm-static /usr/bin/qemu-arm-static
```