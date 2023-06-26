output "sg" {
  description = "Security Group details"
  value       = aws_security_group.sg
}

output "instance" {
  description = "Instance details"
  value       = aws_instance.ec2
}

output "eip" {
  description = "EIP details"
  value       = aws_eip.eip
}

output "iam_role" {
  description = "IAM role details"
  value       = aws_iam_role.role
}

output "iam_profile" {
  description = "IAM profile details"
  value       = aws_iam_instance_profile.iam_profile
}
