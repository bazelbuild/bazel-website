---
layout: contribute
title: Bzlmod roadmap
---

<style>
  .padbottom { padding-bottom: 10px; }
  .etabox {
    background: #EFEFEF;
    color: #38761D;
    font-size: 15px;
    font-weight: bold;
    display: inline;
    padding: 6px;
    margin-right: 10px;
  }
  .donestatus {
    color: #00D000;
    font-weight: bold;
    padding-left: 10px;
  }
  .droppedstatus {
    color: #D00000;
    font-weight: bold;
    padding-left: 10px;
  }
  .inprogressstatus {
    color: #D0D000;
    font-weight: bold;
    padding-left: 10px;
  }
</style>

# Bzlmod Roadmap

*Point of contact:* [Wyverald](https://github.com/Wyverald), [meteorcloudy](https://github.com/meteorcloudy)

## Goal

To implement the new Bazel external dependency management system (Bzlmod) designed in [Bazel External Dependencies Overhaul](https://docs.google.com/document/d/1moQfNcEIttsk6vYanNKIy3ZuK53hQUFq1b1r0rmsYVg/edit?usp=sharing).

## Current Status (as of 2021-05-20)

We have [a MVP](https://github.com/Wyverald/bazel/pull/16) that implements some of the following features.

## Bazel Module & Registry

Bazel module:
* MODULE.bazel file support <span class="donestatus">(DONE in MVP)</span>
* Bazel module discovery & selection (MVS) <span class="donestatus">(DONE in MVP)</span>
* Support `repo_name` in `bazel_dep` <span class="donestatus">(DONE in MVP)</span>
* Support `dev_dependency` in `bazel_dep`
* Support `compatibility_level` in `module`
* `override_dep` support: `single_version_override`, `archive_override`, `git_override`, `local_path_override` <span class="donestatus">(DONE in MVP)</span>
* `override_dep` support: `multiple_version_override`

Registry:
* Implement fetching modules from index registry <span class="donestatus">(DONE in MVP)</span>
* Implement fetching modules from single module registry (git repo with version tags)

## Module Rule

* module rule Starlark API
* module rule API in MODULE.bazel
* module rule resolution

## Tooling

Dependency Management:
* Upgrade / downgrade a module version
* External dependency graph querying

Registry:
* Helper tool for managing index registry <span class="inprogressstatus">IN PROGRESS</span>

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

