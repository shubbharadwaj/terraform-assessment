variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "alb_sg_id" {
  type = string
}