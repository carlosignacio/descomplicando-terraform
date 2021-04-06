data "aws_ami" "ubuntu"{
  most_recent = true

  filter {
    name    = "name"
    values  = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"] 
  }

  owners = ["099720109477"] # Ubuntu
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "Hello, %{ if var.name == "gomex" } ${var.name} %{ else }nao valeu %{ endif }!"
    #Name = "HelloWorld ${var.name}"
    #Env  = var.environment
  }
}