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
  instance_type = "<YOURINSTANCE_TYPE>"
  ami = "<YOUR_AMI_ID>"
  keygen = "<YOUR_PUBLIC_KEY>"
  cidr_block = "<CIDR_BLOCK>"
  default_vpc_id = "<VPC_ID>"
  subnet_id = "<SUBNET_ID>"
}

output "public_ip" {
  value = module.apache
}

```
