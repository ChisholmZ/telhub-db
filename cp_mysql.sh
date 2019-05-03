#!/bin/bash
# copy mysql folder out of pod
#~zach

source telhub.sh

CON=$(getCon)
docker cp $CON:/var/lib/mysql ./
