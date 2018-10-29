#!/bin/bash -e

[ -z "$VERSION_LABEL" ] && echo "Need to set VERSION_LABEL" && exit 1;
[ -z "$BUCKET_NAME" ] && echo "Need to set BUCKET_NAME" && exit 1;

ZIP_NAME=$(date +"%Y-%m-%d-%s")-$VERSION_LABEL-source-archive.zip
REGION=ap-northeast-1
APPLICTION_NAME=ChatbotApi

zip -r "/tmp/$ZIP_NAME" . -x *.git* *~ "aws-eb/*" "jenkins/*"
aws s3 --region $REGION cp /tmp/$ZIP_NAME s3://$BUCKET_NAME/
aws elasticbeanstalk delete-application-version --region $REGION --application-name $APPLICTION_NAME --version-label $VERSION_LABEL
aws elasticbeanstalk create-application-version --region $REGION --application-name $APPLICTION_NAME --version-label $VERSION_LABEL --description "build" --source-bundle S3Bucket="$BUCKET_NAME",S3Key="$ZIP_NAME"
