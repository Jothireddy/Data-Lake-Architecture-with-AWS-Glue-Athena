# Create a Glue Catalog Database
resource "aws_glue_catalog_database" "data_lake_db" {
  name = var.glue_database_name
}

# Upload the ETL script to an S3 bucket (we use the processed data bucket as a staging area)
resource "aws_s3_bucket_object" "glue_etl_script" {
  bucket = aws_s3_bucket.processed_data.bucket
  key    = "glue/etl_script.py"
  source = "../glue/etl_script.py"
  etag   = filemd5("../glue/etl_script.py")
}

# Create an AWS Glue Job that runs the ETL script
resource "aws_glue_job" "etl_job" {
  name     = var.glue_job_name
  role_arn = var.glue_service_role_arn  # You must create a Glue service role manually with the required policies

  command {
    name            = "glueetl"
    script_location = "s3://${aws_s3_bucket.processed_data.bucket}/glue/etl_script.py"
    python_version  = "3"
  }

  default_arguments = {
    "--TempDir" = "s3://${aws_s3_bucket.processed_data.bucket}/temp/"
    "--job-bookmark-option" = "job-bookmark-disable"
    "--raw_bucket" = aws_s3_bucket.raw_data.bucket
    "--processed_bucket" = aws_s3_bucket.processed_data.bucket
    "--database" = aws_glue_catalog_database.data_lake_db.name
  }

  max_retries = 1
  timeout     = 10
}
