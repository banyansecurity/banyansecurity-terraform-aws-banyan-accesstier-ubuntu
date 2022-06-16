provider "aws" {
  region = "us-east-1"
}

variable "refresh_token" {
  type = string
}

module "aws_accesstier" {
  source                 = "banyansecurity/banyan-accesstier-ubuntu/aws"
  version                = "1.1.0"

  vpc_id                 = "vpc-0e73afd7c24062f0a"
  public_subnet_ids      = ["subnet-09ef9206ca406ffe7", "subnet-0bcb18d59e3ff3cc7"]
  private_subnet_ids     = ["subnet-00e393f22c3f09e16", "subnet-0dfce8195de704b65"]
  cluster_name           = "cluster1"
  site_name              = "my-banyan-site"
  ssh_key_name           = "my-ssh-key"
  api_server             = "https://net.banyanops.com/api/v1"  
  refresh_token          = var.refresh_token

  min_instances          = 1  
}

