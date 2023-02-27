terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "defaultUala"
  region  = "us-east-1"
}

// resource "aws_iam_role" "dynamoDBContactRole" {}

resource "aws_lambda_function" "go_savecontact_lambda" {
    architectures                  = [
        "x86_64",
    ]
    function_name                  = "GoSaveContactJime" 
    filename     	           = "main.zip"
    handler                        = "main"
    layers                         = []
    memory_size                    = 512
    package_type                   = "Zip"
    reserved_concurrent_executions = -1
    role                           = "arn:aws:iam::645342462303:role/service-role/dynamoDBContactRole"
    runtime                        = "go1.x"
    source_code_hash               = "tb0CpxhMN6St2PmTW/7HvngzziiOv9As7JUyqg5hicw="
    tags                           = {}
    tags_all                       = {}
    timeout                        = 15

    ephemeral_storage {
        size = 512
    }

    timeouts {}

    tracing_config {
        mode = "PassThrough"
    }
}


// terraform import aws_lambda_function.go_savecontact_lambda GoSaveContactJime
