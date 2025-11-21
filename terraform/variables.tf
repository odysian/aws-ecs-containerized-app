variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "ecs-app"
}

variable "environment" {
  description = "Environment (dev, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
