#!/usr/bin/env bash

aws cloudformation deploy \
  --template-file domain-template.yaml \
  --capabilities CAPABILITY_IAM \
  --stack-name cryptobookdomain$1 \
  --parameter-overrides \
    DomainName=${DOMAIN_NAME} \
    RecordSetA_IP=${RECORDSETA_IP}


# Notification
if [ "$(uname)" == 'Darwin' ]; then
  osascript -e 'display notification "Done." with title "Deploy Script"'
fi
