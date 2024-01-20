# terraform {
#   backend "s3" {
#     bucket         = "tf-s3bucket-portfolio-tfstate-1"
#     key            = "website/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-statelock-file"
#   }
# }