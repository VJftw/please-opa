package please_opa.common

test_array_to_set {
	array_to_set(["foo", "bar"]) == {"bar", "foo"}
}
