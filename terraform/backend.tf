terraform {
  backend "s3" {
    bucket         = "simpletime-state-bucket"
    key            = "simple-time-service.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-table"
  }
}
