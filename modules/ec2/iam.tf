resource "aws_iam_instance_profile" "iam_profile" {
  count = var.instance_profile != "" ? 0 : 1
  name  = "${var.name}-profile"
  role  = element(aws_iam_role.role.*.name, count.index)
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role" "role" {
  count              = var.instance_profile != "" ? 0 : 1
  name               = "${var.name}-role"
  description        = "${var.name} IAM Role"
  path               = "/"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags = merge(
    local.common_tags
  )
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy" "policy" {
  count  = var.instance_profile == "" && var.create_iam_policy ? 1 : 0
  name   = "${var.name}-policy"
  role   = element(aws_iam_role.role.*.id, count.index)
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "iam:ListSSHPublicKeys",
                "iam:GetSSHPublicKey"
            ],
            "Resource": [
                "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/*"
            ]
        }
    ]
}
EOF
}
