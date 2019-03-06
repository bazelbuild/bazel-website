---
layout: contribute
title: Guide for rolling out breaking changes
---

# Guide for rolling out breaking changes

It is inevitable that we will make breaking changes to Bazel. We will have to
change our designs and fix the things that do not quite work. However, we need
to make sure that community and Bazel ecosystem can follow along. This document
describes the process for Bazel contributors to make a breaking change in Bazel.

1. Follow the [design document policy](designs/index.html).

1. [File a GitHub issue.](#github-issue)

1. [Implement the change.](#implementation)

1. [Update labels](#labels)

1. [Flip the incompatible flag.](#flipping-the-flag)


## GitHub issue

[File a GitHub issue](https://github.com/bazelbuild/bazel/issues) in the Bazel
repository. [See example.](https://github.com/bazelbuild/bazel/issues/6611)

* The title starts with the name of the flag (the flag name will start with
  `incompatible_`).

* Add the label [`incompatible-change`](https://github.com/bazelbuild/bazel/labels/incompatible-change).

* The description contains a description of the change and a link to relevant
  design documents.

* The description contains a migration recipe, to explain users how they should
  update their code. Ideally, when the change is mechanical, include a link to a
  migration tool.

* The description includes the intended length of migration window.

For the migration tool, consider contributing to
[Buildifier](https://github.com/bazelbuild/buildtools/blob/master/buildifier/README.md).
It is able to apply automated fixes to BUILD, WORKSPACE, and bzl files. It may
also report warnings.


## Implementation

Create a new flag in Bazel. The default value must be false. The help text
should contain the URL of the GitHub issue. As the flag name starts with
`incompatible_`, it needs metadata tags:

```java
      metadataTags = {
        OptionMetadataTag.INCOMPATIBLE_CHANGE,
        OptionMetadataTag.TRIGGERED_BY_ALL_INCOMPATIBLE_CHANGES
      },
```

In the commit description, use [`RELNOTES:`](release-notes.html) followed by a short description, the
name of the flag, and a link to the GitHub issue.


## Labels

Once the commit is merged, add the label
[`migration-ready`](https://github.com/bazelbuild/bazel/labels/migration-ready)
to the GitHub issue.

Later a [Bazel release manager](https://github.com/bazelbuild/continuous-integration/blob/master/docs/release-playbook.md)
will update the issue and replace the label with `migration-xx.yy`.

The label `breaking-change-xx.yy` communicates when we plan to flip the flag. If
a migration window needs to be extended, the author updates the label on GitHub
issue accordingly.

If a problem is found with the flag and users are not expected to migrate yet:
remove the flags `migration-xx.yy`.


## Flipping the flag

Before flipping the default value of the flag to true, please make sure that:

  * The migration window is respected.
  * User concerns and questions have been resolved.
  * The flip will not break projects. Check the [`Bazelisk + Incompatible
    flags`](https://buildkite.com/bazel/bazelisk-plus-incompatible-flags/) pipeline.

When changing the flag default to true, please:

  * Use [`RELNOTES:`](release-notes.html) in the commit description, with the
    name the of the flag.
  * Use `Fixes #xyz` in the description, so that the GitHub issue gets closed
    when the commit is merged.

If a breakage is found after the flag flip, the commit will be rolled back.
