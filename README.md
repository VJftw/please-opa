# please-opa
OPA integration w/ the Please build system.

This includes support for the following:
 * `opa_toolchain`: Easy management of multiple versions of OPA.
 * `opa_bundle`: OPA bundling from the local filesystem.
 * `opa_test`: OPA tests against bundles.
 * `opa_eval`: OPA eval script for use in runtime evaluations.
    * Useful for evaluating non-build time data like Terraform Plans.
 * `opa_eval_test`: OPA eval as build time test.
    * Useful for evaluating data available at build like Kubernetes resources.


## `opa_toolchain`

This build rule allows you to specify a OPA version to download and re-use in all rules.

## `opa_bundle`

This build rule allows you to create an OPA bundle which may be used by other OPA bundles or evaluated with.

See `//example/...` for examples of `opa_bundle`s.

## `opa_test`

This build rule allows you to run OPA tests against `opa_bundle`s to verify the bundle's rego code performs its expected behaviours.

See `//example/...` for examples of `opa_test`s.

## `opa_eval`

This build rule creates a binary which may be used to evaluate arbitrary data at run-time with the given OPA bundles.

See `//example/...` for examples of `opa_eval`s.

## `opa_eval_test`

This build rule creates a "test" rule which can may be used to evaluate arbitrary data at test-time using the given `opa_eval` binary.

See `//example/...` for examples of `opa_eval_test`s.
---

## Usage


### Please Plugin

```ini
; .plzconfig

; Support the non *-rules repo name format of Please plugins.
PluginRepo = "https://github.com/{owner}/{plugin}/archive/{revision}.zip"

[Plugin "opa"]
Target = //third_party/plugins:opa
```

```python
# //third_party/plugins/BUILD
plugin_repo(
    name = "opa",
    owner = "VJftw",
    plugin = "please-opa",
    revision = "v0.0.1",
)
```
