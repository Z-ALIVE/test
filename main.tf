

#To access existing VPC
data "aws_vpc" "main" {
  id = var.default_vpc_id
}

data "aws_subnet" "project-vpc-subnet" {
    id = var.subnet_id
}

#data to inject to ec2 instance
data "template_file" "user_data" {
    template = file("./terraform-aws-apache-example/userdata.yaml")
    }

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.keygen
}

resource "aws_instance" "server01" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = "${aws_key_pair.deployer.key_name}"
    subnet_id = "${data.aws_subnet.project-vpc-subnet.id}"
    vpc_security_group_ids = [aws_security_group.sg_server01.id]
    user_data = data.template_file.user_data.rendered
    associate_public_ip_address = true
    
    tags = {
      Name = "server01-${local.project_name}"
    }
}

resource "aws_security_group" "sg_server01" {
  name        = "sg_server01"
  description = "server01 security group"
  vpc_id      = data.aws_vpc.main.id

  ingress {   
        description      = "HTTP"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

  ingress {
        description      = "SSH"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}


