variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  description = "Primary CIDR block for both VPCs (overlapping)"
  default     = "10.0.0.0/16"
}

variable "vpc_a_secondary_cidr" {
  description = "Secondary CIDR block for VPC A"
  default     = "100.64.1.0/24"
}

variable "vpc_b_secondary_cidr" {
  description = "Secondary CIDR block for VPC B"
  default     = "100.64.2.0/24"
}

variable "availability_zone_a" {
  description = "Availability Zone for VPC A resources"
  default     = "eu-west-2a"
}

variable "availability_zone_b" {
  description = "Availability Zone for VPC B resources"
  default     = "eu-west-2b"
}
