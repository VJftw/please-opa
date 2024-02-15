package please_opa.terraform

import data.please_opa.common as common

import rego.v1

test_deny_unapproved_create if {
	deny["'unapproved_resource.web' is planned for creation but not in the allowlist"] with input as {"resource_changes": [{
		"address": "unapproved_resource.web",
		"type": "unapproved_resource",
		"change": {"actions": ["create"]},
	}]}
		with data.terraform as {"allowed_resources": []}
}

test_allow_approved_create if {
	common.is_empty(deny) with input as {"resource_changes": [{
		"address": "unapproved_resource.web",
		"type": "unapproved_resource",
		"change": {"actions": ["create"]},
	}]}
		with data.terraform as {"allowed_resources": ["unapproved_resource"]}
}
