variable "project_name" {
  description = "Project name used for backend resource naming"
  type        = string
  default = "taskapp-anthony-cicd"
}

variable "aws_region" {
  description = "AWS region for backend resources"
  type        = string
  default     = "eu-west-1"
}
