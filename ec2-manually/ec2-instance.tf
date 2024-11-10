resource "aws_instance" "myinstance" {
   
  instance_type = var.aws_instance_type
  ami = data.aws_ami.amzlinux2.id
  subnet_id = aws_vpc.main.id

  depends_on = [ aws_vpc.main.id ]
  
  tags ={
    name = "ec2"
  }
}