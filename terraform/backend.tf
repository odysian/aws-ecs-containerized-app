terraform {
  backend "s3" {
    bucket         = "odys-terraform-state-2025" # Use your existing bucket
    key            = "ecs-app/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-locks" # Use your existing table
  }
}
