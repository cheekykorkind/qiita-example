provider "aws" {
  region = "us-east-1"
  access_key = "123"
  secret_key = "xyz"
  skip_credentials_validation = true
  skip_requesting_account_id = true
  skip_metadata_api_check = true
  s3_force_path_style = true
  endpoints {
    lambda = "http://localstack:4566"
  }
}

# var.lambda_zip_pathはterraform apply時にパラメータとして渡されました
variable "lambda_zip_path" {
    type = "string"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = var.lambda_zip_path
  function_name = "hello_lambda"
  role          = "whatever"
  handler       = "app.lambda_handler"

  source_code_hash = "${filebase64sha256(var.lambda_zip_path)}"

  runtime = "python3.7"

  environment {
    variables = {
      foo = "bar"
    }
  }
}
