# Terraform S3 Static Website

This project demonstrates how to deploy a static website on AWS S3 using Terraform. It uses Infrastructure as Code (IaC) principles to automate the creation and configuration of cloud resources.

## Overview

The project provisions an S3 bucket, enables static website hosting, configures public access permissions, and uploads website files (HTML and CSS). After deployment, the website is accessible via the S3 website endpoint over HTTP.

## Features

* Automated S3 bucket creation using Terraform
* Static website hosting configuration
* Public read access using bucket policy
* Upload of website files (index.html and style.css)
* Output of website URL after deployment

## Technologies Used

* Terraform
* AWS S3
* HTML
* CSS

## Project Structure

project-static-website/
│
├── main.tf
├── index.html
├── style.css
├── .gitignore
├── README.md

## Prerequisites

* AWS account
* AWS CLI configured (`aws configure`)
* Terraform installed

## How to Run

1. Initialize Terraform:

   terraform init

2. Validate configuration:

   terraform validate

3. Apply configuration:

   terraform apply

4. Confirm the deployment by typing:

   yes

## Output

After successful deployment, Terraform will output the S3 website endpoint:

http://my-webapp-bucket-72cb84be5fc5088d.s3-website.ap-south-1.amazonaws.com

Open this URL in your browser to view the website.

## Important Notes

* The website is hosted over HTTP (not HTTPS)
* The S3 bucket is publicly accessible for static hosting
* Terraform state files are excluded using .gitignore

## Use Case

This project is useful for learning:

* Infrastructure as Code (IaC)
* AWS S3 static website hosting
* Terraform resource management
* Basic DevOps workflows

## Future Improvements

* Add HTTPS using CloudFront
* Configure custom domain with Route 53
* Implement remote backend for Terraform state (S3 + DynamoDB)
* Add CI/CD pipeline using GitHub Actions

## Author

Amit Vaghela
