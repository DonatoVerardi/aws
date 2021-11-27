# Static Website

The main goal of this lab is to familiarize with the AWS environment and create a basic HTTP static website.

## Tools and components

This lab uses the following tools and components:

- AWSCLI
- CloudFormation
- S3
- Route53
- CloudFront

## Prerequisites

Have a valid AWS Account.
Install and configure the AWS Cli: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-prereqs.html
Install aws-mfa in order to simplify the use of the CLI, if MFA is enabled: https://pypi.org/project/aws-mfa/

## Deploy

make apply

## Test

Browse to this address:
https://bucket-static-website-123.s3.eu-west-3.amazonaws.com/index.html

## Cleanup

make delete

## Thanks to

https://medium.com/swlh/aws-website-hosting-with-cloudformation-guide-36cac151d1af
