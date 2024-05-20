#!/bin/bash

set -e

export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=

aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 964037622278.dkr.ecr.ap-northeast-2.amazonaws.com
docker build -t ci-test .
docker tag ci-test:latest 964037622278.dkr.ecr.ap-northeast-2.amazonaws.com/ci-test:latest
docker push 964037622278.dkr.ecr.ap-northeast-2.amazonaws.com/ci-test:latest
