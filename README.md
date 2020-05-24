# biarms/qemu-bin


[![build status](https://api.travis-ci.org/biarms/qemu-bin.svg?branch=master)](https://travis-ci.org/biarms/qemu-bin)

[![Nb of layers of the docker image](https://images.microbadger.com/badges/image/biarms/qemu-bin.svg)](https://microbadger.com/images/biarms/qemu-bin)
[![Docker image version](https://images.microbadger.com/badges/version/biarms/qemu-bin.svg)](https://microbadger.com/images/biarms/qemu-bin)
[![Commit id](https://images.microbadger.com/badges/commit/biarms/qemu-bin.svg)](https://microbadger.com/images/biarms/qemu-bin)


## *!!! DEPRECATED !!!*
According to https://github.com/multiarch/qemu-user-static#multiarch-compatible-images-deprecated, copying qemu bin in docker image is now useless. Therefore, this repo will be archived and not more maintained.

## Overview

This git repo build a docker image that contains qemu binaries downloaded from https://github.com/multiarch/qemu-user-static/releases.

Results will be pushed on [dockerhub](https://hub.docker.com/r/biarms/qemu-bin).

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

PS: do not forget the install qemu on the docker host that will run that kind of images, thanks to the `docker run --rm --privileged multiarch/qemu-user-static:register --reset` command, as stated on https://hub.docker.com/r/multiarch/qemu-user-static/.
