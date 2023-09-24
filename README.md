Terraform module to provision an EC2 instance that is running apache.

Not intended for production use. Just showcasing how to use public module.

```hcl
terraform {

}

provider "aws" {
  region = "us-east-1"
}

module "apache" {
  source = ".//terraform-aws-apache-example"
  instance_type = "t2.micro"
  ami = "ami-04cb4ca688797756f"
  keygen = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9zHlx6OrO61Wb/OSCP0iL/Qlgt9MnezcZOlwCfaAkhkCYZcKCqJOnl+2b3NfjiA2uSdPQ3jEHX+kRskuR38vrpfTAqsmowIMvYaZKmLVoeVWW6OACaWtcIbjUSB7SnjAFGIMAzJoUYSdd9ErHctCs9t/R1u6xcMzbDheoLNyItMPBEEKbsY6XNR2uMcZ90iCIQxlzAyfegdBVjG82XFiVknr/B4vTgGmKcGuhuOoH1eYiCHv93JblCpP1LdPtb6BhWHN8d76fQOlEOdBeBaxtlB/GWuQaU6OEIiQwGWYbWiYKqKdqr5Idw5XX+aIt4p73FG0xaUQc030VIVST7bgicprp7RKxEHM33soBpou88Q/v7/Fkk0KMmiHWI4acU2a/Q3ryfGd8EEsClTpQ+un4E85jQix22RBDT/VCFEXV2G8li8g9IPoIDtaawvDtjHaKz9BnUsBFKlZ5Ric82kC74Vb98g7j6unA1zrdvCj8bg96W1LQMrGRIdUDrmVNgA0= zuscorpuz@raven"
  cidr_block = "172.0.0.0/16"
  default_vpc_id = "vpc-0fa7c37f3951191ad"
  subnet_id = "subnet-0800e7f927373f3bb"
}

output "public_ip" {
  value = module.apache
}

```
