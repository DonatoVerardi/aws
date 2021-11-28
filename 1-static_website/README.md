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

in order to use and configure Route53, you'll need a valid domain.
I created my own for free on this website: https://www.cloudns.net/

1. Create a free account
2. Select "Free DNS"
3. Select "Free zone"
4. Give it a name, in my case donato.cloudns.ph

In AWS, create a Hosted Zone and enter the subdomain. In my case: lab.donato.cloudns.ph

In the records, you will notice the nameserver in the column "Value/Route to".

Go back to ClouDNS and add a new record in your domain, for each NS address displayed in the AWS "Hosted Zone"

- Type: NS
- Host: subdomain (in my case: hello.donato.cloudns.ph)
- Points to: enter the address of the AWS NS. For example ns-1190.awsdns-20.org

Check the resolution with dig:

> dig @8.8.8.8 lab.donato.cloudns.ph +trace

## Deploy

make deploy

## Test

Browse to this address:
https://bucket-static-website-123.s3.eu-west-3.amazonaws.com/index.html

## Cleanup

make clean

## Thanks to

- https://coletiv.com/blog/how-to-use-aws-cloud-formation-to-setup-the-infrastructure-for-a-static-website/
- https://medium.com/swlh/aws-website-hosting-with-cloudformation-guide-36cac151d1af
- https://advancedweb.hu/how-to-test-with-a-live-domain-name-for-free/
