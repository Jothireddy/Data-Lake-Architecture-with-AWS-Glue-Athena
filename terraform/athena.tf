# (Optional) Create an Athena Named Query that can be run later
resource "aws_athena_named_query" "sample_query" {
  name      = "SampleQuery"
  database  = var.glue_database_name
  query     = file("../queries/sample_query.sql")
  description = "Sample Athena query to retrieve processed data"
}
