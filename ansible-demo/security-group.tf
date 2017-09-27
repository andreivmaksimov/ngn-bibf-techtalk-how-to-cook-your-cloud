/* Default security group */
resource "aws_security_group" "default" {
  name = "default-${var.tag_prefix}"
  description = "Default security group that allows inbound and outbound traffic from all hosts"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags { 
    Name = "${var.tag_prefix}-default-vpc" 
  }
}