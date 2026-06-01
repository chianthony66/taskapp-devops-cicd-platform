terraform {
  backend "s3" {
    bucket         = "taskapp-anthony-cicd-terraform-state"
    key            = "root/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "taskapp-anthony-cicd-terraform-locks"
    encrypt        = true
  }
}
