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
      "test -e /usr/bin/python || (sudo add-apt-repository -y ppa:fkrull/deadsnakes && sudo apt-get update && sudo apt-get install -y python2.7)",
      "sudo ln -s /usr/bin/python2.7 /usr/bin/python"
    ]
  }
  provisioner "local-exec" {
    command = "echo \"[webserver]\n${aws_instance.web.public_ip} ansible_connection=ssh ansible_ssh_user=ubuntu\" > ansible/inventory &&  ansible-playbook -i ansible/inventory ansible/playbook.yml"
  }
}