terraform {
  backend "s3" {
    bucket         = "tf-state-bucket"
    key            = "simple-time-service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-table"
    encrypt        = true
  }
}
