## AWS Cloudfront hosting

This package is a Terraform module, responsible for creating hosting from S3 bucket using AWS Cloudfront.  
Hosted website can be access only over HTTPS. 

You will need to provide the domain along with ACM certificate.

![AWS Cloudfront](https://d2908q01vomqb2.cloudfront.net/5b384ce32d8cdef02bc3a139d4cac0a22bb029e8/2018/06/27/thumbnail.png)

### Provisioned resources

 - S3 Bucket (versioning: enabled; public access: blocked)
 - Cloudfront distribution

### Input variables

`aws_account_id` - Your AWS Account ID

`project_name` - Custom project name (will be used as a prefix in resources)

`domain` - Domain name.

`domain_certificate_arn` - SSL Certificate issued for domain provided above.

`root_object` - file used as entry (default: index.html)

`price_class` - AWS Cloudfront price class (https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PriceClass.html)

`allowed_methods` - Allowed HTTP methods. (default: GET; HEAD)

`cached_methods` - Cached HTTP methods. (default: GET; HEAD)


### Output variables:

`domain_name` - Hosting domain name (domain issued by CF, can be used in R53)

`hosted_zone_id` - Hosted zone of CF domain.

