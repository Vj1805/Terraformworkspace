# Create Security Group - SSH Traffic
resource "aws_security_group" "vpc-wp" {
  name        = "terra-${terraform.workspace}"    # terra-default
  description = "Dev VPC SSH"                       # vpc-ssh-dev
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "terra-${terraform.workspace}"
    //"Name" = "vm-${terraform.workspace}-${count.index}" # vm-default-0 , vm-default-1
  }
}

# # Create Security Group - Web Traffic
# resource "aws_security_group" "vpc-web" {
#   name        = "vpc-web1-${terraform.workspace}"
#   description = "Dev VPC web"
#   ingress {
#     description = "Allow Port 80"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "Allow Port 443"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     description = "Allow all ip and ports outbound"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

# }

# # Create EC2 Instance - Amazon Linux
# resource "aws_instance" "my-ec2-vm" {
#   ami           = "ami-079b5e5b3971bd10d"
#   instance_type = var.instance_type
#   //key_name      = "dev-lin"
#   //count = terraform.workspace   
# 	user_data = file("apache-install.sh")  
#   vpc_security_group_ids = [aws_security_group.vpc-ssh2.id, aws_security_group.vpc-web2.id]
#   tags = {
#     "Name" = "web"
#     //"Name" = "vm-${terraform.workspace}-${count.index}" # vm-default-0 , vm-default-1
#   }
# }







