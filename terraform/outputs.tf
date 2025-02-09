output "raw_bucket" {
  description = "S3 bucket for raw data"
  value       = aws_s3_bucket.raw_data.bucket
}

output "processed_bucket" {
  description = "S3 bucket for processed data"
  value       = aws_s3_bucket.processed_data.bucket
}

output "glue_job_name" {
  description = "Name of the Glue ETL job"
  value       = aws_glue_job.etl_job.name
}
