provider "bridgecrew" {
  url = "https://www.bridgecrew.cloud"
  //token = "gets value from environment"
}

//data "bridgecrew_repositories" "all" {}
//data "bridgecrew_suppressions" "all" {}
//data "bridgecrew_policies" "all" {}
//data "bridgecrew_repository_branches" "all" {}

terraform {
  required_providers {
    bridgecrew = {
      version = "0.1.1"
      source  = "jameswoolfenden/dev/bridgecrew"
    }
  }
}

//output "repos" {
//  value = data.bridgecrew_repositories.all
//}


//output "suppression" {
//  value = data.bridgecrew_suppressions.all
//}

//output "polices" {
//  value = data.bridgecrew_policies.all
//}

//output "branches" {
// value = data.bridgecrew_repository_branches.all
//}


resource "bridgecrew_policy" "new" {
  count           = 2
  cloud_provider  = "aws"
  title           = "my first test ${count.index}"
  severity        = "CRITICAL"
  category        = "LOGGING"
  resource_types  = ["aws_instance", "aws_s3_bucket"]
  iscustom        = true
  code            = "echo 'hello world'"
  condition_query = "some shizzle"
  benchmarks {
    benchmark = "free text for now"
    version   = ["1.1", "1.2"]
  }

  benchmarks {
    benchmark = "another benchmark"
    version   = ["9.9", "0.3"]
  }

  accountsdata {
    amounts = {
      CLOSED     = 1
      DELETED    = 0
      OPEN       = 0
      REMEDIATED = 0
      SUPPRESSED = 0
    }
    repository = "JamesWoolfenden/learn-terraform"
  }
}

output "policy" {
  value = bridgecrew_policy.new
}
