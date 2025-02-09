# Data Lake Architecture with AWS Glue & Athena

This project demonstrates how to build a scalable data lake on AWS by combining S3 for storage, AWS Glue for ETL (Extract, Transform, Load) pipelines, and Athena for interactive querying of your data.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setup & Deployment](#setup--deployment)
  - [Infrastructure Provisioning](#infrastructure-provisioning)
  - [ETL Pipeline & Querying](#etl-pipeline--querying)
- [Configuration Details](#configuration-details)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

The solution provisions two S3 buckets:
- **Raw Data Bucket:** Stores incoming (unprocessed) data.
- **Processed Data Bucket:** Stores data after transformation by AWS Glue.

AWS Glue is used to create a catalog (database) and run an ETL job that transforms raw data into a processed format. Amazon Athena is configured to query the processed data directly from S3 using SQL.

## Features

- **Scalable Data Storage:** Uses S3 to store raw and processed data.
- **Serverless ETL Pipeline:** AWS Glue job processes data without managing servers.
- **Interactive Analysis:** Athena enables SQL queries over large datasets.
- **Infrastructure as Code:** Terraform provisions all resources for reproducibility and version control.

## Technologies Used

- **AWS S3:** Data storage for raw and processed data.
- **AWS Glue:** Managed ETL service to transform and catalog data.
- **Amazon Athena:** Serverless interactive query service.
- **Terraform:** Infrastructure provisioning and management.
- **Python:** Programming language used for the Glue ETL script.

## Project Structure

data-lake-architecture/ ├── README.md # Project documentation ├── terraform/
│ ├── provider.tf # AWS provider configuration │ ├── s3.tf # S3 bucket resources │ ├── glue.tf # AWS Glue resources (database, job, crawler) │ ├── athena.tf # Athena resources (e.g., named queries) │ ├── variables.tf # Input variables for configuration │ └── outputs.tf # Key outputs (e.g., bucket names, Glue job name) ├── glue/ │ └── etl_script.py # AWS Glue ETL job script ├── queries/ │ └── sample_query.sql # Sample Athena SQL query └── scripts/ └── deploy.sh # Helper deployment script


## Prerequisites

- **AWS Account:** With permissions to create S3 buckets, Glue resources, and Athena queries.
- **Terraform (v1.0+):** [Download Terraform](https://www.terraform.io/downloads.html)
- **AWS CLI:** Installed and configured with your AWS credentials.
- **Python 3.7+** for local testing of the Glue script (if desired).
- **Git:** To clone and manage the repository.

## Setup & Deployment

### Infrastructure Provisioning

1. **Clone the Repository:**

```bash
   git clone <repository_url>
```
Configure Variables:

Edit terraform/variables.tf to set your desired AWS region, bucket names, and other configuration values.

Deploy with Terraform:

Use the helper script or run Terraform manually:
```
cd terraform
terraform init
terraform plan -out=tfplan
terraform apply -auto-approve tfplan

```
Terraform will create:

Two S3 buckets (raw and processed data).
An AWS Glue database.
An AWS Glue job that runs the ETL script.
(Optionally) Athena resources such as a named query.
ETL Pipeline & Querying
ETL Job:
The Glue job (configured in Terraform) uses glue/etl_script.py to read data from the raw bucket, process it, and write output to the processed bucket.

## Querying Data:
Use Athena (via the AWS Console or via the provided sample query in queries/sample_query.sql) to run SQL queries against the processed data stored in S3.

## Configuration Details
Terraform Files:
provider.tf sets up your AWS provider.
s3.tf provisions S3 buckets.
glue.tf provisions a Glue database and job.
athena.tf (optional) provisions Athena resources.
Glue ETL Script:
Located at glue/etl_script.py, it contains the transformation logic.
Athena Query:
queries/sample_query.sql contains an example SQL query you can run in Athena.
## Troubleshooting
Terraform Errors:
Verify AWS credentials and permissions. Check that bucket names are globally unique.
Glue Job Issues:
Review Glue logs in CloudWatch to diagnose ETL script errors.
Athena Query Errors:
Confirm that the Glue Catalog table is correctly defined and points to the processed S3 bucket location.
Contributing
Contributions are welcome! Fork the repository, make your improvements, and submit a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

Happy building your data lake!
