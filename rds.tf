# creating RDS Instance
resource "aws_db_subnet_group" "tf-rds" {
  name = "main"
  subnet_ids = [aws_subnet.database-tf-sn-1.id, aws_subnet.database-tf-sn-2.id]
  tags = {
    Name = "My DB subnet group"
}
}
resource "aws_db_instance" "default" {
  allocated_storage = 10
  db_subnet_group_name = aws_db_subnet_group.default.id
  engine = "mysql"
  engine_version = "8.0.28"
  instance_class = "t2.micro"
  multi_az = true
  db_name = "db_1"
  username = "username"
  password = "password"
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
  tags = {
    db_identifier= "DB-1"

}
}
