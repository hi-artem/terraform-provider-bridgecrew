package bridgecrew

import (
	"fmt"
	"testing"

	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/resource"
)

func TestAccDataSourceRepositories(t *testing.T) {
	resource.ParallelTest(t, resource.TestCase{
		PreCheck:          func() { testAccPreCheck(t) },
		ProviderFactories: testAccProviders,
		Steps: []resource.TestStep{
			{
				Config: testAccDataSourceRepositories(),
			},
		},
	})
}

func testAccDataSourceRepositories() string {
	return fmt.Sprintf(
		`
data "bridgecrew_repositories" "test" {
}`)
}
