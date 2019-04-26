#!/bin/bash -e

REGISTRY_URL="199886244715.dkr.ecr.us-east-1.amazonaws.com"
SOURCE_IMAGE="calculadora"
TARGET_IMAGE="199886244715.dkr.ecr.us-east-1.amazonaws.com/calculadora"
TARGET_IMAGE_LATEST="199886244715.dkr.ecr.us-east-1.amazonaws.com/calculadora:latest"
TIMESTAMP=$(date '+%Y%m%d%H%M%S')
VERSION="${TIMESTAMP}-${TRAVIS_COMMIT}"
TARGET_IMAGE_VERSIONED="${TARGET_IMAGE}:${VERSION}"
aws configure set default.region us-east-1
$(aws ecr get-login --no-include-email)

# update latest version
docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE_LATEST}
docker push ${TARGET_IMAGE_LATEST}

# push new version
docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE_VERSIONED}
docker push ${TARGET_IMAGE_VERSIONED}