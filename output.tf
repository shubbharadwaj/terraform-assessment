output "instance_ids" {
  value = module.ec2.instance_ids
}

output "alb_dns" {
  value = module.alb.alb_dns
}