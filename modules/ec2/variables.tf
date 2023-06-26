variable "name" {
  description = "name of the instance"
  type        = string
}

variable "environment" {
  type        = string
  description = "Environment"
}

variable "vpc_id" {
  description = "VPC ID on which instance will be deployed"
  type        = string
}

variable "subnet_filter_key" {
  description = "Subnet tags key for filtering subnets"
  type        = string
  default     = "subnet_type"
}

variable "subnet_type" {
  description = "Subnet on which instance will be deployed"
  type        = string
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
}

variable "ami" {
  description = "ami through which instance will be deployed"
  type        = string
}

variable "instance_count" {
  description = "Count of instances"
  type        = string
  default     = "1"
}

variable "key_name" {
  description = "key to be used in the instance"
  type        = string
}

variable "associate_public_ip_address" {
  description = "enable public IP address"
  type        = bool
  default     = false
}

variable "monitoring" {
  description = "enable enhanced monitoring"
  type        = bool
  default     = false
}

variable "root_volume_size" {
  description = "root volume size"
  type        = string
  default     = "30"
}

variable "root_volume_type" {
  description = "root volume type"
  type        = string
  default     = "gp2"
}

variable "root_encryption" {
  description = "root Volume Encryption"
  type        = bool
  default     = false
}

variable "instance_tags" {
  description = "Additional tags for the instance"
  type        = map(string)
  default     = {}
}

variable "add_ebs_volume" {
  description = "add EBS volume to the instance"
  type        = bool
  default     = false
}

variable "ebs_volume_size" {
  description = "EBS volume size"
  type        = string
  default     = "50"
}

variable "ebs_volume_type" {
  description = "EBS volume type"
  type        = string
  default     = "gp2"
}

variable "ebs_encryption" {
  description = "Boolean to enable Encryption of EBS"
  type        = bool
  default     = false
}

variable "device_name" {
  description = "Device name of EBS mounted on instance"
  type        = string
  default     = "/dev/sdf"
}

variable "add_eip" {
  description = "add EIP to the instace"
  type        = bool
  default     = false
}

variable "get_password_data" {
  description = "If true, wait for password data to become available and retrieve it."
  type        = bool
  default     = null
}

variable "user_data_base64" {
  description = "Can be used instead of user_data to pass base64-encoded binary data directly"
  type        = string
  default     = null
}

variable "create_iam_policy" {
  description = "Boolean to create iam policy"
  type        = bool
  default     = true
}

variable "instance_profile" {
  description = "Instance profile for EC2"
  type        = string
  default     = ""
}
