module screenshot {
  source                   = "cloudposse/cloudfront-s3-cdn/aws"
  version                  = "0.35.0"
  namespace                = "screenshot"
  stage                    = "prod"
  name                     = "s3"
  aliases                  = ["screenshot.gregsharpe.co.uk"]
  parent_zone_id           = module.common.gregsharpe_root_hosted_zone_id
  index_document           = "index.html"
  logging_enabled          = "false"
  acm_certificate_arn      = module.common.gregsharpe_root_acm_arn
  minimum_protocol_version = "TLSv1.2_2018"
  price_class              = "PriceClass_100"
  cached_methods           = ["GET", "HEAD", "OPTIONS"]
  cors_allowed_headers     = ["*"]
  cors_allowed_origins     = ["*"]
}
