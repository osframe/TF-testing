resource "aws_key_pair" "My_keypair" {
  key_name   = "tf-ssh-key"
  public_key = var.ssh_key

  tags = local.all_tags
}
