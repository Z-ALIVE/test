output "server01_ip_address" {
    value = aws_instance.server01.public_ip
}