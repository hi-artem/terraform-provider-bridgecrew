---
page_title: "Bridgecrew Provider"
subcategory: ""
description: |-
---

# Bridgecrew Provider

The Bridgecrew provider is used to interact with the Bridgecrew Security Platform
.

In order to use this Provider, you must have an active account with Bridgecrew.
Pricing and sign-up information can be found at <https://www.bridgecrew.cloud/login/signUp?return_to=%2Fsignup>

## Example Usage

```hcl
# Configure the Bridgecrew Provider
provider "bridgecrew" {
  token = "test"
}


data "bridgecrew_policies" "mypolicies" {
}
```

## Authentication

The Bridgecrew provider offers an API key based method of providing credentials for
authentication. The following methods are supported, in this order, and
explained below:

- Static API key
- Environment variables

### Static API Key

Static credentials can be provided by adding a `token` in-line in the
Bridgecrew provider block:

Usage:

```hcl
provider "bridgecrew" {
  token = "test"
}

data "bridgecrew_policies" "mypolicies" {
}
```

Best practice would be to not enter a value, to avoid any potential of adding your secrets to source control.
You can create a credential on the Personal API Tokens page: https://www.bridgecrew.cloud/integrations/api-token

### Environment variables

You can provide your API key via `BRIDGECREW_API` environment variable,
representing your Bridgecrew API key. When using this method, you may omit the
Bridgecrew `provider` block entirely:

```hcl
data "bridgecrew_policies" "mypolicies" {
}
```

Usage:

```bash
$ export BRIDGECREW_API="aBridgecrewapikey"
$ terraform plan
```

## Argument Reference

The following arguments are supported in the `provider` block:

* `token` - (Optional) This is the API key. It must be provided, but
  it can also be sourced from the `BRIDGECREW_API` environment variable

* `url` - (Optional) This is the API server hostname. It is required
  if using a private instance of the API and otherwise defaults to the
  public Bridgecrew production service. It can also be sourced from the
  `BRIDGECREW_URL` environment variable