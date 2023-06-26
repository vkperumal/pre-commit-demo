data "aws_availability_zones" "zones" {}

data "aws_caller_identity" "current" {}

data "aws_subnet_ids" "subnet_list" {
  vpc_id = var.vpc_id
  filter {
    name   = "tag:Environment"
    values = [var.environment]
  }
  filter {
    name   = "tag:${var.subnet_filter_key}"
    values = [var.subnet_type]
  }
}

locals {
  subnet_order = reverse(data.aws_subnet_ids.subnet_list.ids)
  common_tags = {
    Name        = var.name
    Environment = var.environment
    Created_by  = "terraform"
  }
}

resource "aws_instance" "ec2" {
  #ts:skip=AC_AWS_0479 Kept optional for now can be changed in future
  #ts:skip=AC_AWS_0480 Variable is available to enable it
  count                       = var.instance_count
  ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = var.instance_profile != "" ? var.instance_profile : aws_iam_instance_profile.iam_profile[0].name
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = element(local.subnet_order.*, count.index % length(data.aws_subnet_ids.subnet_list.ids))
  get_password_data           = var.get_password_data
  user_data_base64            = var.user_data_base64
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "optional"
  }
  monitoring = var.monitoring
  tags = merge(
    local.common_tags,
    var.instance_tags
  )
  root_block_device {
    volume_type = var.root_volume_type
    volume_size = var.root_volume_size
    encrypted   = var.root_encryption
  }
  volume_tags = merge(local.common_tags)
  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      volume_tags,
      ebs_block_device,
      tags
    ]
  }
}
