output "website_url" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
  description = "Public URL of the static website"
}

output "bucket_name" {
  value = aws_s3_bucket.static.bucket
}
