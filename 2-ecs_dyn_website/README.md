# ECS Dynamic Website

The main goal of this lab is to familiarize with the AWS environment and create a CRUD application in a container hosted in ECS.

## Tools and components

This lab uses the following tools and components:

- AWSCLI
- CloudFormation
- Route53
- CloudFront
- RDS (Relational Database Service)
- ECS (Elastic Container Service) on Fargate
- ECR (Elastic Container Registry)
- VPC (Virtual Private Cloud)
- ELB (Elastic Load Balancer)

## Prerequisites

you need to have docker installed on your local machine

## Setup

Clone this repository.

The following scripts will create a Stack in CloudFormation which:

- todo

- Create a S3 Bucket
- Create a Cloud Front Access Identity
- Create a Cloud Front Distribution which uses the certificate and the Cloud Front Access Identity
- Set the permission to access the S3 bucket only over the Cloud Front Access Identity
- Add a DNS entry in route53 which resolves your URL to the cloud front distribution public URL

## Deployment

Open the file static_website_stack.yml and change the Parameter Values (default):

- BucketName= _this must be a unique name_
- DomainName= _URL of your website_
- CertificateARN= _ARN of your certificate, that you will find in AWS Certificate Manager_

And then, in the console:

> make deploy

## Test

Browse to the URL you defined as DomainName (with https://)

## Cleanup

In the console:

> make clean

Manual tasks to do, after the cleanup is completed:

- delete certificate in ACM
- delete Hosted Zone in Route53

## Many many thanks to

- https://medium.com/@msahinkarademir/how-to-create-an-aws-ecs-fargate-cluster-for-our-web-applications-b387611dd7e6
- https://medium.com/@arliber/aws-fargate-from-start-to-finish-for-a-nodejs-app-9a0e5fbf6361
