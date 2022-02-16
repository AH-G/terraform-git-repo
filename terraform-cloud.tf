data "aws_ami" "aws-ami-2" {
  most_recent = true
  owners = ["amazon"]
//  provider = aws.terraform-2
  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


resource "aws_instance" "dev_instance" {
//  provider = aws.terraform-2
  ami = data.aws_ami.aws-ami-2.id
  instance_type = "t2.micro"
  tags = {
    Name = "dev_instance"
  }
}
