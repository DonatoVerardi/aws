# AWS Lab

This is my aws lab repository. I experiment several deployments, components and architecture.

In order for you to run these lab, you need:

- an AWS account.
- Install and configure the AWS Cli: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-prereqs.html
- Install aws-mfa in order to simplify the use of the CLI, if MFA is enabled: https://pypi.org/project/aws-mfa/

Let's have some fun and let me know if have any comments.

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
In my case: lab.donato.cloudns.ph

Select "Public hosted zone" and click "Create hosted zone".
You should see a two new records: one of type "NS" and another of type "SOA".
Under "Value/Route traffic to" of the record of type "NS" you will see four URIs.
In my case:

- ns-988.awsdns-59.net.
- ns-1642.awsdns-13.co.uk.
- ns-1480.awsdns-57.org.
- ns-237.awsdns-29.com.

Browse to https://www.cloudns.net/ and sign in.
In "DNS Hosting" click on your domain.
Click on the button "+ Add new record" on the bottom left.
For each NS address displayed in the AWS "Hosted Zone"

- Type: NS
- Host: subdomain (in my case: lab.donato.cloudns.ph)
- Points to: enter the address of the AWS NS. For example ns-988.awsdns-59.net (without the "." at the end)

You should see four new records created which point to the AWS nameservers.

You can check the resolution using for example dig:

> dig @8.8.8.8 lab.donato.cloudns.ph +trace

### Create SSL certificates

In the AWS Console Management, search for Certificate Manager.

Switch to "us-east-1 - N. Virginia"

Create a new certificate by clicking on "Request a certificate".

1. Select "Request a public certificate" and next
2. Enter your Fully qualified Name. In my case: lab.donato.cloudns.ph
3. Select "DNS Validation - recommended"
4. Click on "Request"

Your certificate should be stuck in the Status "Pending validation"

Click on it and select "Create records in Route 53".
Click on "Create Records".
After a couple of minutes the status should change to "Issued".
