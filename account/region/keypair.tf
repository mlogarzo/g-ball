resource "aws_key_pair" "deployer_key" {
  key_name   = "${local.project}-webserver-key"
  public_key = tls_private_key.rsa.public_key_openssh

  tags = local.tags
}

# RSA key of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096

}

resource "local_file" "key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "key.pem"
}