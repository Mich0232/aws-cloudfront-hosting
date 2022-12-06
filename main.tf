data "aws_cloudfront_cache_policy" "caching_optimized" {
  name = "Managed-CachingOptimized"
}

resource "aws_cloudfront_origin_access_control" "s3_hosting" {
  name                              = aws_s3_bucket.hosting.bucket_regional_domain_name
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "hosting" {
  enabled             = true
  default_root_object = var.root_object
  price_class         = var.price_class
  is_ipv6_enabled     = true

  aliases = [var.domain]

  origin {
    domain_name = aws_s3_bucket.hosting.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.hosting.id

    origin_access_control_id = aws_cloudfront_origin_access_control.s3_hosting.id

    connection_attempts = 3
    connection_timeout  = 10
  }

  default_cache_behavior {
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = var.allowed_methods
    cached_methods         = var.cached_methods
    cache_policy_id        = data.aws_cloudfront_cache_policy.caching_optimized.id
    target_origin_id       = aws_s3_bucket.hosting.id
    smooth_streaming       = false
  }

  viewer_certificate {
    acm_certificate_arn      = var.domain_certificate_arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
