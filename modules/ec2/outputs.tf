output "instance_ids" {
  value = [
    aws_instance.server1.id,
    aws_instance.server2.id
  ]
}