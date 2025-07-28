output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.springboot_ec2.public_ip
}

output "elb_dns_name" {
  description = "Public DNS name of the Application Load Balancer"
  value       = aws_lb.springboot_alb.dns_name
}
