output "domain_name" {
  value = aws_cloudfront_distribution.hosting.domain_name
}

output "hosted_zone_id" {
  value = aws_cloudfront_distribution.hosting.hosted_zone_id
}
