# Variables

variable "env_name" {
  description = "The name of the target environment"
  type        = string
  default     = "poc"
}

variable "ami" {
  description = "The ID of the source AMI"
  type        = string
  default     = "ami-03668ebb7c7101c3c"
}

variable "instance_type" {
  description = "The type of EC2 instance (e.g. t2.micro)"
  type        = string
  default     = "t2.micro"
}

variable "app_listening_port" {
  description = "The listening port for the application"
  type        = string
  default     = "18000"
}

variable "nlb_private_ip" {
  description = "The private IP of the NLB"
  type        = string
  default     = "10.0.1.15"
}
