resource "aws_eip" "eip" {
  count = var.add_eip ? var.instance_count : 0
  vpc   = true
  tags = merge(
    local.common_tags,
    {
      Name = "${var.name}-EIP-${count.index}"
    }
  )
}

resource "aws_eip_association" "eip_association" {
  count         = var.add_eip ? var.instance_count : 0
  instance_id   = element(aws_instance.ec2.*.id, count.index)
  allocation_id = element(aws_eip.eip.*.id, count.index)
}
