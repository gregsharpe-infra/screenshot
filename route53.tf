resource aws_route53_record screenshot_cname {
  zone_id = module.common.gregsharpe_root_hosted_zone_id
  name    = "screenshot.gregsharpe.co.uk"
  type    = "CNAME"
  ttl     = "300"
  records = [module.screenshot.cf_domain_name]
}
