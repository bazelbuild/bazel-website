---
layout: contribute
title: Bzlmod roadmap
---

# Bzlmod Roadmap

*Point of contact:* [Wyverald](https://github.com/Wyverald), [pcloudy](https://github.com/pcloudy)

## Goal

To implement the new Bazel external dependency management system (Bzlmod) designed in [Bazel External Dependencies Overhaul](https://docs.google.com/document/d/1moQfNcEIttsk6vYanNKIy3ZuK53hQUFq1b1r0rmsYVg/edit?usp=sharing).

## Current Situation (as of 2021-05-20)

We have [a MVP](https://github.com/Wyverald/bazel/pull/16) that implements some of the following features.

## Bazel Module & Registry

Bazel module:
* MODULE.bazel file support
* Bazel module discovery & selection (MVS)
* Support `repo_name` in `bazel_dep`
* Support `dev_dependency` in `bazel_dep`
* Support `compatibility_level` in `module`

Resolution:
* `override_dep` support: `single_version_override`, `archive_override`, `git_override`, `local_path_override`
* `override_dep` support: `multiple_version_override`

Registry:
* Implement fetching modules from index registry
* Implement fetching modules from single module registry (git repo with version tags)

## Module Rule

* module rule Starlark API
* module rule API in MODULE.bazel
* module rule resolution

## Tooling

Dependency Management:
* Upgrade / downgrade a module version
* External dependency graph in querying

Registry:
* Helper tool for managing index registry

CI:
* Presubmit for [Bazel Central Registry](https://github.com/bazelbuild/bazel-central-registry)
* Compatibility test for new Bazel module

Migration:
* Helper tool for migrating from WORKSPACE file to MODULE.bazel file

## Other features

* Lock file support
* Support strict repository dependency (only directly dependencies are visible)
* Vendor / offline mode build support
* Shared repository cache (caching the entire repo content instead of just the source archive)

## Documentation

* Bazel module tutorials
* Module rule tutorials
* Best practices for vendor / offline mode
* Best practices for migration

