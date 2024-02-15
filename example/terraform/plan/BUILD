subinclude("//build/defs:opa")

opa_eval_test(
    name = "terraform_eval_test_bad",
    args = [
        # --fail is used here to ensure that bad_tfplan.json results in violations.
        "--fail",
    ],
    data = ["test_data.json"],
    inputs = ["test_bad_tfplan.json"],
    opa_eval_rule = "//example/terraform:terraform_eval",
    query = "data.please_opa.terraform.deny[_]",
)

opa_eval_test(
    name = "terraform_eval_test_good",
    args = [
        # --fail-defined is used here to ensure that good_tfplan.json results in no violations.
        "--fail-defined",
    ],
    data = ["test_data.json"],
    inputs = ["test_good_tfplan.json"],
    opa_eval_rule = "//example/terraform:terraform_eval",
    query = "data.please_opa.terraform.deny[_]",
)
