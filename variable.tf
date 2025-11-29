variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "index_file" {
  description = "Path to index.html file"
  type        = string
  default     = "index.html"
}

variable "error_file" {
  description = "Path to error.html file"
  type        = string
  default     = "error.html"
}
