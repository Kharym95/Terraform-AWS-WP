variable "aws_region" {
  description = "La région de notre infrastructure AWS"
  default     = "eu-west-1"
}

variable "vpc_cidr" {
  description = "Le réseau de notre virtual private cloud"
  default     = "10.0.0.0/16"
}

variable "subnet_private_main" {
  description = "Le sous-réseaux privé de notre infrastructure"
  default     = "10.0.20.0/24"
}

variable "subnet_private_second" {
  description = "Le sous-réseaux privé de notre infrastructure"
  default     = "10.0.22.0/24"
}

variable "subnet_public_main" {
  description = "Le sous-réseaux publique de notre infrastructure"
  default     = "10.0.220.0/24"
}

variable "subnet_public_second" {
  description = "Le sous-réseaux publique de notre infrastructure"
  default     = "10.0.222.0/24"
}

variable "ami" {
  description = "L'Amazon Machine Images de l'instance EC2"
  default     = "ami-0776c814353b4814d"
}

variable "instance_type" {
  description = "Le type de l'instance EC2"
  default     = "t3a.small"
}

variable "rds_allocated_storage" {
  description = "L'espace de stockage alloué à la base de données"
  default     = 20
}

variable "rds_identifier" {
  description = "Le nom de notre instance RDS"
  default     = "kawordpressdb"
}

variable "rds_engine" {
  description = "Le moteur de la base de données"
  default     = "mariadb"
}

variable "rds_engine_version" {
  description = "La version du moteur de la base de données"
  default     = "10.11.6"
}

variable "rds_instance_class" {
  description = "La classe de l'instance de la base de données"
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Le nom de la base de données"
  default     = "kawordpressdb"
}

variable "db_username" {
  description = "Le nom d'utilisateur de la base de données"
  default     = "admin"
}

variable "db_password" {
  description = "Le mot de passe de la base de données"
  default     = "password"
}

variable "rds_db_subnet_group" {
  description = "Le nom du groupe des réseaux de notre RDS"
  default     = "ka-db-subnet-group"
}

