variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "raw_bucket_name" {
  description = "Name of the S3 bucket for raw data"
  type        = string
  default     = "my-data-lake-raw-unique"
}

variable "processed_bucket_name" {
  description = "Name of the S3 bucket for processed data"
  type        = string
  default     = "my-data-lake-processed-unique"
}

variable "glue_job_name" {
  description = "Name of the Glue ETL job"
  type        = string
  default     = "data-lake-etl-job"
}

variable "glue_database_name" {
  description = "Name of the Glue database"
  type        = string
  default     = "data_lake_db"
}
