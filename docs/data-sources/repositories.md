---
layout: "bridgecrew"
page_title: "Bridgecrew: data_source_repositories"
sidebar_current: "docs-bridgecrew-data_source_repositories"

description: |-
Gets a list of all your repositories managed by the Bridgecrew platform <https://docs.bridgecrew.io/reference/getrepositories>.

---

# bridgecrew_repositories

Use this datasource to get the details of your managed repositories from Bridgecrew.




## Example Usage
```hcl
data "bridgecrew_repositories" "myrepositories" {
}
```
<!-- schema generated by tfplugindocs -->
## Schema

### Optional

- **id** (String) The ID of this resource.

### Read-Only

- **repositories** (List of Object) (see [below for nested schema](#nestedatt--repositories))

<a id="nestedatt--repositories"></a>
### Nested Schema for `repositories`

Read-Only:

- **creationdate** (String)
- **defaultbranch** (String)
- **id** (String)
- **ispublic** (Boolean)
- **owner** (String)
- **repository** (String)
- **source** (String)
