provider "aws" {
  profile = "my-demo"
  region = "us-east-1"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    cloudwatchlogs = "http://192.168.33.14:4566"
  }
}

resource "aws_cloudwatch_log_group" "example1" {
  name = "/example1"
}