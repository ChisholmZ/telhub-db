#!/bin/bash
# copy mysql folder out of pod
#~zach

source telhub.sh

POD=$(getPod)
kubectl cp $POD:/var/lib/mysql ./
