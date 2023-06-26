<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.ebs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_eip.eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip_association.eip_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) | resource |
| [aws_iam_instance_profile.iam_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_volume_attachment.ebs_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |
| [aws_availability_zones.zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_subnet_ids.subnet_list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_ebs_volume"></a> [add\_ebs\_volume](#input\_add\_ebs\_volume) | add EBS volume to the instance | `bool` | `false` | no |
| <a name="input_add_eip"></a> [add\_eip](#input\_add\_eip) | add EIP to the instace | `bool` | `false` | no |
| <a name="input_ami"></a> [ami](#input\_ami) | ami through which instance will be deployed | `string` | n/a | yes |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | enable public IP address | `bool` | `false` | no |
| <a name="input_create_iam_policy"></a> [create\_iam\_policy](#input\_create\_iam\_policy) | Boolean to create iam policy | `bool` | `true` | no |
| <a name="input_device_name"></a> [device\_name](#input\_device\_name) | Device name of EBS mounted on instance | `string` | `"/dev/sdf"` | no |
| <a name="input_ebs_encryption"></a> [ebs\_encryption](#input\_ebs\_encryption) | Boolean to enable Encryption of EBS | `bool` | `false` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | EBS volume size | `string` | `"50"` | no |
| <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type) | EBS volume type | `string` | `"gp2"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | n/a | yes |
| <a name="input_get_password_data"></a> [get\_password\_data](#input\_get\_password\_data) | If true, wait for password data to become available and retrieve it. | `bool` | `null` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Count of instances | `string` | `"1"` | no |
| <a name="input_instance_profile"></a> [instance\_profile](#input\_instance\_profile) | Instance profile for EC2 | `string` | `""` | no |
| <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags) | Additional tags for the instance | `map(string)` | `{}` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Type of instance | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | key to be used in the instance | `string` | n/a | yes |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | enable enhanced monitoring | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | name of the instance | `string` | n/a | yes |
| <a name="input_root_encryption"></a> [root\_encryption](#input\_root\_encryption) | root Volume Encryption | `bool` | `false` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | root volume size | `string` | `"30"` | no |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | root volume type | `string` | `"gp2"` | no |
| <a name="input_subnet_filter_key"></a> [subnet\_filter\_key](#input\_subnet\_filter\_key) | Subnet tags key for filtering subnets | `string` | `"subnet_type"` | no |
| <a name="input_subnet_type"></a> [subnet\_type](#input\_subnet\_type) | Subnet on which instance will be deployed | `string` | n/a | yes |
| <a name="input_user_data_base64"></a> [user\_data\_base64](#input\_user\_data\_base64) | Can be used instead of user\_data to pass base64-encoded binary data directly | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID on which instance will be deployed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eip"></a> [eip](#output\_eip) | EIP details |
| <a name="output_iam_profile"></a> [iam\_profile](#output\_iam\_profile) | IAM profile details |
| <a name="output_iam_role"></a> [iam\_role](#output\_iam\_role) | IAM role details |
| <a name="output_instance"></a> [instance](#output\_instance) | Instance details |
| <a name="output_sg"></a> [sg](#output\_sg) | Security Group details |
<!-- END_TF_DOCS -->
