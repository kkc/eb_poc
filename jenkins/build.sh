#!/bin/bash -xe

ENV=${ENV:-dev}
GIT_COMMIT_ID=$(git rev-parse HEAD)
BUCKET_NAME=${BUCKET_NAME:-tthouse-chatbotapi-eb}

# Create a new application version
NODE_ENV="$ENV" \
VERSION_LABEL="$ENV-$GIT_COMMIT_ID" \
BUCKET_NAME="${BUCKET_NAME}" \
./aws-eb/eb-create-application-version.sh
