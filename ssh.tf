resource "aws_key_pair" "ka_ssh" {
  key_name   = "ka_key_ssh"
  public_key = file("C:\\Users\\Karim\\.ssh\\id_rsa.pub")
}