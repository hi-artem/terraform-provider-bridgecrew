package bridgecrew

import (
	"fmt"
	"testing"

	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/resource"
)

func TestAccDataSourceSuppressions(t *testing.T) {
	resource.ParallelTest(t, resource.TestCase{
		PreCheck:          func() { testAccPreCheck(t) },
		ProviderFactories: testAccProviders,
		Steps: []resource.TestStep{
			{
				Config: testAccDataSourceSuppressions(),
			},
		},
	})
}

func testAccDataSourceSuppressions() string {
	return fmt.Sprintf(
		`
data "bridgecrew_suppressions" "test" {
}`)
}
