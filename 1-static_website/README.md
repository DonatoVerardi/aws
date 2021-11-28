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

In order to use and configure Route53, you'll need to create a (free) domain, create a host zone in AWS Route53 and create the SSL certificate.

### Create free domain

I created my own for free on this website: https://www.cloudns.net/

1. Browse to https://www.cloudns.net/
2. Create a free account
3. Select "Free DNS"
4. Select "Free zone"
5. Give it a name, in my case donato.cloudns.ph

### Create a Host Zone in Route53

In the AWS Console Management search for Route53.
Select "Hosted zones" and click "create hosted zone"
https://console.aws.amazon.com/route53/v2/hostedzones#

In the "Domain Name" enter a new subdomain followed by the domain you just created.
In my case: static-website.donato.cloudns.ph

Select "Public hosted zone" and click "Create hosted zone".
You should see a new record of type "NS" with four URL under "Value/Route traffic to".
In my case:

- ns-988.awsdns-59.net.
- ns-1642.awsdns-13.co.uk.
- ns-1480.awsdns-57.org.
- ns-237.awsdns-29.com.

Browse to https://www.cloudns.net/ and login.
In "DNS Hosting" click on your domain.
Click on the button "+ Add new record" on the bottom left.
For each NS address displayed in the AWS "Hosted Zone"

- Type: NS
- Host: subdomain (in my case: static-website.donato.cloudns.ph)
- Points to: enter the address of the AWS NS. For example ns-988.awsdns-59.net (without the "." at the end)

You should see four new records created which point to the AWS nameservers.

You can check the resolution using for example dig:

> dig @8.8.8.8 static-website.donato.cloudns.ph +trace

### Create SSL certificates

In the AWS Console Management, search for Certificate Manager.

Switch to us-east-1 - N. Virginia

Create a new certificate by clicking on "Request".

1. Select "Request a public certificate" and next
2. Enter your Fully qualified Name. In my case: static-website.donato.cloudns.ph
3. Select "DNS Validation" and click on "Request"

Your certificate should be stuck in the Status "Pending validation"

Click on it and select "Create records in Route 53".
Click on "Create Records".
After a couple of minutes the status should change to "Issued"

## Setup

Clone this repository.

The following scripts will create a Stack in CloudFormation which:

- Create a S3 Bucket
- Create a Cloud Front Access Identity
- Create a Cloud Front Distribution which uses the certificate and the Cloud Front Access Identity
- Set the permission to access the S3 bucket only over the Cloud Front Access Identity
- Add a DNS entry in route53 which resolves your URL to the cloud front distribution public URL

## Deployment

Open the file config.mk and change the values:

- AWS_BUCKET_NAME= <this must be a unique name>
- AWS_DOMAIN_NAME= <URL of your website>
- AWS_CERTIFICATE_ARN= <ARN of your certificate>

make deploy

## Test

Browse to the URL you defined as AWS_DOMAIN_NAME (with https://)

## Cleanup

make clean

## Thanks to

- https://coletiv.com/blog/how-to-use-aws-cloud-formation-to-setup-the-infrastructure-for-a-static-website/
- https://medium.com/swlh/aws-website-hosting-with-cloudformation-guide-36cac151d1af
- https://advancedweb.hu/how-to-test-with-a-live-domain-name-for-free/
- https://adamtheautomator.com/aws-s3-static-ssl-website/
