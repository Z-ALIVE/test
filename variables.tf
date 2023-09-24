#EC2
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "ami" {
    type = string
}
variable "keygen" {
    type = string
}


#VPC
variable "cidr_block"{
    type = string
}
variable "default_vpc_id" {
  type = string
}
variable "subnet_id" {
  type = string
}