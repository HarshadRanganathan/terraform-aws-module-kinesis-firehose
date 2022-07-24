resource "aws_kinesis_firehose_delivery_stream" "kinesis" {
  //A name to identify the stream
  name = var.aws_kinesis_firehose_delivery_stream_name
  tags =var.tags
  //This is the destination to where the data is delivered
  destination = var.kinesis_destination
  server_side_encryption {
    enabled  = var.server_side_encryption_enabled
    key_type = var.key_type
  }
  extended_s3_configuration {
    //The ARN of the AWS credentials.
    role_arn = var.role_arn

    kms_key_arn = var.kms_key_arn
    //The ARN of the S3 bucket
    bucket_arn = "arn:aws:s3:::${var.s3_bucket_name}"

    //Buffer incoming data to the specified size, in MBs, before delivering it to the destination.
    buffer_size = var.kinesis_buffer_size

    //Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination.
    buffer_interval = var.kinesis_buffer_interval

    //The compression format
    compression_format  = var.kinesis_compression_format
    error_output_prefix = var.error_output_prefix
    prefix              = var.prefix

    cloudwatch_logging_options {
      enabled         = var.cloudwatch_logging_options_enabled
      log_group_name  = var.log_group_name
      log_stream_name = var.log_stream_name
    }

    dynamic_partitioning_configuration {
      enabled = var.dynamic_partitioning_enabled
    }
    processing_configuration {
      enabled = var.processing_configuration_enabled
      processors {
        type = var.processors_type
        dynamic "parameters" {
          for_each = var.parameters
          content {
            parameter_name  = parameters.value["name"]
            parameter_value = parameters.value["value"]
          }
        }
      }
    }
  }
}
