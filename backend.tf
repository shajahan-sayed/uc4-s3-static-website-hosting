terraform {
   backend "s3" {
      bucket = s3_1
      value  = "terraform.tfstate"
      region = "ap-southeast-2"
    }
}
   
