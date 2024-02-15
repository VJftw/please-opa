package please_opa.common

array_to_set(array) = result {
	result := {x |
		x := array[_]
	}
}
