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

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  billing_mode     = "PROVISIONED"
  hash_key         = "id"
  name             = "Contacts"
  read_capacity    = 1
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  tags             = {}
  tags_all         = {}
  write_capacity   = 1

  attribute {
    name = "id"
    type = "S"
  }

  point_in_time_recovery {
    enabled = false
  }
}

