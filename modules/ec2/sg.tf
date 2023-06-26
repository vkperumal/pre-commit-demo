resource "aws_security_group" "sg" {
  name        = "${var.name}-sg"
  description = "${var.name} Security group"
  vpc_id      = var.vpc_id

  tags = merge(
    local.common_tags,
    var.instance_tags,
    {
      Name = "${var.name}-sg"
    }
  )
  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      ingress,
      egress
    ]
  }
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
}
