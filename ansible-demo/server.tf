/* NAT/VPN server */
resource "aws_instance" "web" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.public.id}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  key_name = "${aws_key_pair.ansible.key_name}"
  source_dest_check = false
  tags = { 
    Name = "web"
  }
  connection {
    user = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa_without_pass")}"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "test -e /usr/bin/python || (sudo apt install -y python-minimal)"
    ]
  }
  provisioner "local-exec" {
    command = "sleep 5 && echo \"[webserver]\n${aws_instance.web.public_ip} ansible_connection=ssh ansible_ssh_user=ubuntu\" > ansible/inventory &&  ansible-playbook -i ansible/inventory ansible/playbook.yml"
  }
}