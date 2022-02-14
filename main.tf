data "aws_ami" "aws-ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "dev_instance" {
  ami = data.aws_ami.aws-ami.id
  instance_type = "t2.micro"
  tags = {
    Name = "dev_instance"
  }
}
