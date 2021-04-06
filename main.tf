provider "aws" {
  region  = "us-east-1"
  #region  = "${terraform.workspace == "production" ? "us-east-1" : "us-east-2"}"
  version = "~> 2.0"
}