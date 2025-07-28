
provider "aws" {
region = var.aws_region
}


#security group for the Spring Boot application

resource "aws_security_group" "springboot_sg" {
name = "springboot-sg"
description = "Allow SSH, HTTP, 9000"
vpc_id = var.vpc_id

ingress {
description = "SSH"
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

ingress {
description = "HTTP"
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

ingress {
description = "Spring Boot App"
from_port = 9000
to_port = 9000
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}

#EC2 Instance
resource "aws_instance" "springboot_ec2" {
ami = "ami-0f58b397bc5c1f2e8" # Ubuntu 22.04 in ap-south-1
instance_type = var.instance_type
key_name = var.key_name
subnet_id = var.subnet_ids[0]
vpc_security_group_ids = [aws_security_group.springboot_sg.id]
associate_public_ip_address = true
user_data = file("user-data.sh")

tags = {
Name = "springboot-ec2"
}
}

#Target Group and Application Load Balancer
resource "aws_lb_target_group" "springboot_tg" {
  name = "springboot-tg"
  port = 9000
  protocol = "HTTP"
  vpc_id = var.vpc_id
    health_check {
        path = "/"
        interval = 30
        timeout = 5
        healthy_threshold = 2
        unhealthy_threshold = 2
        matcher = "200-299"
    }  
}

#Load Balancer 
resource "aws_lb" "springboot_alb" {
name = "springboot-alb"
internal = false
load_balancer_type = "application"
security_groups = [aws_security_group.springboot_sg.id]
subnets = var.subnet_ids
}

#Listener

resource "aws_lb_listener" "alb_listener" {
load_balancer_arn = aws_lb.springboot_alb.arn
port = 80
protocol = "HTTP"

default_action {
type = "forward"
target_group_arn = aws_lb_target_group.springboot_tg.arn
}
}

#Attach EC2 instance to Target Group

resource "aws_lb_target_group_attachment" "tg_attachment" {
target_group_arn = aws_lb_target_group.springboot_tg.arn
target_id = aws_instance.springboot_ec2.id
port = 9000
}