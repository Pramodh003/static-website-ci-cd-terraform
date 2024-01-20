terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region                                = var.region
}

terraform {
  backend "s3" {
    bucket         = "tf-s3bucket-portfolio-tfstate-1"
    key            = "website/s3.tfstate"
    region         = "us-east-1"
    
  }
}



module "dns_acm" {
  source                                  = "./modules/route53_acm"
  root_domain                             = var.root_domain
  dns_record_ttl                          = var.dns_record_ttl
}


module "s3_website"{
  source                                    = "./modules/s3-website"
  website_bucket_name                       = var.website_bucket_name
  force_destroy                             = var.force_destroy
  versioing_enabled                         = var.versioing_enabled
  index_document                            = var.index_document
  region                                    = var.region

}