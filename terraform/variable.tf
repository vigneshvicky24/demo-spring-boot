variable "aws_region" {
description = "AWS region"
default = "ap-south-1"
}

variable "instance_type" {
description = "EC2 instance type"
default = "t2.micro"
}

variable "key_name" {
description = "Name of the EC2 Key Pair for SSH"
type = string
}

variable "vpc_id" {
description = "Your default VPC ID"
type = string
}

variable "subnet_ids" {
description = "List of public subnet IDs in your VPC"
type = list(string)
}


