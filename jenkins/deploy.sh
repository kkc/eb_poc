#!/bin/bash -xe

[ -z "$ENV" ] && echo "Need to set ENV" && exit 1;
[ -z "$VERSION_LABEL" ] && echo "Need to set VERSION_LABEL" && exit 1;

APPLICATION_NAME=ChatbotApi
EB_ENV=Chatbot-dev
REGION=ap-northeast-1

if [ ${ENV} == "production" ]; then
    EB_ENV=Chatbot-production
fi

aws elasticbeanstalk update-environment \
--region $REGION \
--application-name $APPLICATION_NAME \
--environment-name ${EB_ENV} \
--version-label "$ENV-$VERSION_LABEL"
