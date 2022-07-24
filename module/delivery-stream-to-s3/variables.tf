variable "server_side_encryption_enabled" {
  type = string
}

variable "key_type" {
  type = string
}

variable "prefix" {
  type = string
}

variable "cloudwatch_logging_options_enabled" {
  type = string
}

variable "log_group_name" {
  type = string
}

variable "log_stream_name" {
  type = string
}

variable "dynamic_partitioning_enabled" {
  type = string
}

variable "processing_configuration_enabled" {
  type = string
}

variable "processors_type" {
  type = string
}

variable "s3_bucket_name" {
  type = string
}

variable "error_output_prefix" {
  type = string
}

variable "aws_kinesis_stream_arn" {
  type = string
}

variable "role_arn" {
  type = string
}

variable "aws_kinesis_firehose_delivery_stream_name" {
  type = string
}

variable "kms_key_arn" {
  type = string
}
variable "kinesis_destination" {
  type    = string
  default = "extended_s3"
}

variable "kinesis_buffer_size" {
  default = 128
}

variable "kinesis_buffer_interval" {
  default = 300
}

variable "kinesis_compression_format" {
  type    = string
  default = "GZIP"
}

variable "parameters" {
  type = list(object({
    name  = string
    value = string }))
  default =  [{
    name  = "test"
    value = "{topic:.topic}"
  }, {
    name  = "test"
    value = "JQ-1.6"
  }]
}

variable "tags" {
  type= map(string)
  default = {
    "ManagedBy" = "Terraform"
    "App"       = "pes-tf-aws-kinesis-firehose"
  }
}