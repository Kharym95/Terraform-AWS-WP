output "instance_id" {
  description = "ID de l'instance EC2"
  value       = aws_instance.ka_ec2.id
}

output "instance_public_ip" {
  description = "IP publique de l'instance EC2"
  value       = aws_instance.ka_ec2.public_ip
}

output "rds_endpoint" {
  description = "Adresse de l'instance RDS"
  value       = aws_db_instance.kawordpressdb.address
}