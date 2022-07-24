provider "aws" {
  version = ">= 4.1.0"
  region  = "us-east-1"
}

provider "local" {
  version = "~> 1.4"
}

provider "null" {
  version = "~> 2.1.2"
}

provider "template" {
  version = "~> 2.1.2"
}