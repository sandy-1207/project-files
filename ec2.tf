# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "food" {
  ami                         = "ami-06489866022e12a14"
  instance_type               = "t2.micro"
  key_name                    = "test"
  vpc_security_group_ids      = ["${aws_security_group.tf-sg.id}"]
  subnet_id                   = aws_subnet.tf-sn-1.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  tags = {
    Name = "My Public Instance"
  }
}
# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "ecomm" {
  ami                         = "ami-06489866022e12a14"
  instance_type               = "t2.micro"
  key_name                    = "test"
  vpc_security_group_ids      = ["${aws_security_group.tf-sg.id}"]
  subnet_id                   = aws_subnet.tf-sn-2.id
  associate_public_ip_address = true
  user_data                   = file("data1.sh")
  tags = {
    Name = "My Public Instance 2"
  }
}
