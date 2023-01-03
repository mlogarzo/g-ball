provider "aws" {
  region = "${local.region}"
}

terraform {
  backend "s3" {
    bucket         = "mlogarzo"
    key            = "infrastructure/terraform.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "go-ball-dynamodb-table"
  }
}

# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "go-ball-dynamodb-table"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
#
#   tags = local.tags
# }