resource "aws_key_pair" "ansible" {
  key_name = "ansible-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}