#!/bin/bash

docker run \
    -p 25565:25565
    -v /local/path/to/world:/minecraft/world \
    daantrical/all-the-mods-3-remix-docker
