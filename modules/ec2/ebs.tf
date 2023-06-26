resource "aws_ebs_volume" "ebs" {
  #ts:skip=AC_AWS_0459 Variable is available to enable it
  count             = var.add_ebs_volume ? var.instance_count : 0
  availability_zone = element(aws_instance.ec2.*.availability_zone, count.index)
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type
  encrypted         = var.ebs_encryption
  tags = merge(
    local.common_tags,
    {
      Name = "${var.name}-EBS-${count.index}"
    },
    var.instance_tags
  )
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  count       = var.add_ebs_volume ? var.instance_count : 0
  device_name = var.device_name
  volume_id   = element(aws_ebs_volume.ebs.*.id, count.index)
  instance_id = element(aws_instance.ec2.*.id, count.index)
}
