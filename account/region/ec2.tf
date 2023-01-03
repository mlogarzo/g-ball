resource "aws_instance" "webserver" {
  
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.small"
  key_name      = "${local.project}-webserver-key"

  vpc_security_group_ids = ["${aws_security_group.web_sg.id}"]

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./key.pem")
      host        = self.public_ip
    }
  }

  tags = merge({
    Name = "${local.project}-webserver"
  }, local.tags)

}

resource "aws_security_group" "web_sg" {
    name        = "allow SSH, HTTP"
    description = "Allow ssh inbound traffic"

    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]

    }

  tags = local.tags
}