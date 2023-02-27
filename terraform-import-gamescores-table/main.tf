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
  region  = "us-west-2"
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
    hash_key       = "UserId1"
    name           = "GameScores"
    range_key      = "GameTitle"
    read_capacity  = 20
    stream_enabled = false
    tags           = {
        "Environment" = "dev"
        "Name"        = "dynamodb-table-1"
    }
    tags_all       = {
        "Environment" = "dev"
        "Name"        = "dynamodb-table-1"
    }
    write_capacity = 20

    attribute {
        name = "GameTitle"
        type = "S"
    }
    attribute {
        name = "TopScore"
        type = "N"
    }
    attribute {
        name = "UserId1"
        type = "S"
    }

    global_secondary_index {
        hash_key           = "GameTitle"
        name               = "GameTitleIndex"
        non_key_attributes = [
            "UserId1",
        ]
        projection_type    = "INCLUDE"
        range_key          = "TopScore"
        read_capacity      = 10
        write_capacity     = 10
    }

    point_in_time_recovery {
        enabled = false
    }

    timeouts {}
}