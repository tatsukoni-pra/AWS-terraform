terraform {
  required_version = "1.7.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.0"
    }
  }
  backend "s3" {
    bucket  = "weather-report-tfstates"
    key     = "import-demo.tfstate"
    region  = "ap-northeast-1"
    profile = "tatsukoni"
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "tatsukoni"
}
