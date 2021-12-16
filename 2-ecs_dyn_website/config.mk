### AWS Configuration
# This is the config which will be used by the 'deploy' and 'clean' make targets
AWS_STACK_NAME=fargate
AWS_IMAGE_NAME=nginx
AWS_DOMAIN_NAME=static-website.donato.cloudns.ph
AWS_CERTIFICATE_ARN="arn:aws:acm:us-east-1:440111066673:certificate/ae2b1b4f-aa3c-4a85-a0cb-782579d6caa9"
AWS_REGION=eu-west-3
AWS_ACCOUNT_ID=440111066673