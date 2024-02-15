subinclude("//build/defs:opa")

opa_bundle(
    name = "terraform",
    srcs = ["terraform.rego"],
    root = "please_opa/terraform",
    visibility = ["PUBLIC"],
    deps = ["//example/common"],
)

opa_test(
    name = "terraform_test",
    srcs = [
        "terraform_test.rego",
    ],
    deps = [
        ":terraform",
        "//example/common",
    ],
)

opa_eval(
    name = "terraform_eval",
    bundles = [
        ":terraform",
        "//example/common:common",
    ],
    visibility = ["PUBLIC"],
)
