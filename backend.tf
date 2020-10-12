terraform {
  backend "s3" {
    bucket         = "gregsharpe-tfstate"
    key            = "gregsharpe-infra/screenshot/terraform.state"
    dynamodb_table = "gregsharpe-tfstate-lock"
    region         = "eu-west-1"
  }
}
