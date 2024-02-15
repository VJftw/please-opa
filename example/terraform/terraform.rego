package please_opa.terraform

import data.please_opa.common as common

import data.terraform
import input as tfplan

deny[msg] {
	# deny when created resource type is not in allowlist.
	created_addresses := {address: resource |
		resource := resources_per_action("create")[_]
		address := resource.address
	}

	some address
	r := created_addresses[address]

	not common.contains(data.terraform.allowed_resources, r.type)

	msg := sprintf("'%s' is planned for creation but not in the allowlist", [address])
}

resources_per_action(action) = resources {
	resources := [resource |
		resource := tfplan.resource_changes[_]

		# conditions
		resource.change.actions[_] == action
	]
}
