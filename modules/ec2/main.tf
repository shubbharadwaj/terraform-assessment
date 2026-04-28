resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "server1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnets[0]

  user_data = <<EOF
#!/bin/bash
yum install -y httpd
systemctl start httpd
echo "Hello from server 1" > /var/www/html/index.html
EOF

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
}

resource "aws_instance" "server2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnets[1]

  user_data = <<EOF
#!/bin/bash
yum install -y httpd
systemctl start httpd
echo "Hello from server 2" > /var/www/html/index.html
EOF

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
}