terraform {
  backend "s3" {
    bucket         = "terraform-state-simpletimeservice"
    key            = "simple-time-service.tfstate"
    region         = "us-east-1"
  }
}
