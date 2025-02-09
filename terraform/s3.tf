resource "aws_s3_bucket" "raw_data" {
  bucket = var.raw_bucket_name

  tags = {
    Name = "DataLakeRaw"
  }
}

resource "aws_s3_bucket" "processed_data" {
  bucket = var.processed_bucket_name

  tags = {
    Name = "DataLakeProcessed"
  }
}
