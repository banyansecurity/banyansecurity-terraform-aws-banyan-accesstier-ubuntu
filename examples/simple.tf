provider "aws" {
  region = "us-west-2"
}

variable "refresh_token" {
  type = string
}

module "aws_accesstier" {
  source                 = "github.com/banyansecurity/terraform-aws-banyan-accesstier-ubuntu"
  vpc_id                 = "vpc-0e73afd7c24062f0a"
  public_subnet_ids      = ["subnet-09ef9206ca406ffe7", "subnet-0bcb18d59e3ff3cc7"]
  private_subnet_ids     = ["subnet-00e393f22c3f09e16", "subnet-0dfce8195de704b65"]
  cluster_name           = "us-west1"
  site_name              = "my-banyan-site"
  site_domain_names      = ["*.bnndemos.com"]
  ssh_key_name           = "my-ssh-key-name"
  refresh_token          = var.refresh_token
  rate_limiting = {
      enabled = true
      max_credits = 1000
      interval = "1m"
      credits_per_interval = 10
      enable_by_key = true
      key_lifetime = "9m"
  }
}

