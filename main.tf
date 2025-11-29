resource "aws_s3" "static" {
   bucket = var.bucket_name

   tags = {
     Name = "static"
   }
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "policy" {
   bucket = aws_s3_bucket.static.id

     policy = jsonencode({
     Version = "2012-10-17"
     Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.static.arn}/*"
      }
    ]
  })
}

# Upload index.html
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.static.bucket
  key          = "index.html"
  source       = var.index_file
  content_type = "text/html"
  acl          = "public-read"
}

# Upload error.html
resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.static.bucket
  key          = "error.html"
  source       = var.error_file
  content_type = "text/html"
  acl          = "public-read"
}

