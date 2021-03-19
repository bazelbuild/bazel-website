---
layout: contribute
title: Support Policy
---

# Support Policy

The Bazel team generally avoids making backwards-incompatible changes. However,
these changes are sometimes necessary to fix bugs, make improvements (such as
improving performance or usability) to the system, or to lock down APIs that
are known to be brittle.

Before any major change, you will have advance notice on the
[bazel-discuss](https://groups.google.com/forum/#!forum/bazel-discuss) mailing list.
Both undocumented features (attributes, rules, "Make" variables, and flags) and
documented features that are marked *experimental* are subject to change at any
time without prior notice.

Report any bugs or regressions you find on
[GitHub](https://github.com/bazelbuild/bazel/issues). The repository maintainers make
an effort to triage reported issues within 2 business days.

## Releases

We regularly publish [binary releases of Bazel](https://github.com/bazelbuild/bazel/releases).

### Policy

Every beginning of the month (we target the first business day of the month), we create a new release
candidate for a new MINOR version (e.g. 0.6.0). The work is tracked by a [release bug on GitHub](https://github.com/bazelbuild/bazel/issues?q=is%3Aissue+is%3Aopen+label%3Arelease) which indicates
the exact target date for the incoming month and assigned to the current Release Manager.
Those release candidates should pass all our unit tests, and show no unwanted regression in the
projects tested on [Buildkite](https://buildkite.com/bazel).

We announce those release candidates on [bazel-discuss](https://groups.google.com/forum/#!forum/bazel-discuss).
Over the next days, we monitor community bug reports for regressions in release candidate.

If no regressions are discovered, we officially release the candidate after one week. However,
regressions can delay the release of a release candidate. If regressions are found, we apply
corresponding cherry-picks to the release candidate to fix those regressions. If no further
regressions are found for two business days, but not before one week has elapsed since the first
release candidate, we release it.

After a release candidate is cut, we do not cherry-pick new features into it.
Moreover, if we discover that a new feature is buggy, we might decide to roll it back from a
release candidate. Only critical, high-impact bugs will be fixed in a release candidate.

A release can only be released on a day where the next day is a business day.

If a critical issue is found on the latest release, a patch release can be emitted by applying the
corresponding cherry-pick to the release tag. Being another patch to an existing release, the
release candidate for a patch release can be released after 2 business days.

### Testing

We run nightly build of all the projects running on [ci.bazel.build](https://ci.bazel.build/) using Bazel
binaries built at head, and using the release binaries. We notify projects going to be impacted by a
breaking change. Google's internal continuous integraion test run all the applicable build targets
at Google nightly.

When a release candidate is issued, we test more projects at Google like [TensorFlow](https://tensorflow.org)
on their complete test suite using the release candidate binaries. If you have a critical project
using Bazel, we recommend that you establish an automated testing process that tracks the current
release candidate, and report any regressions.
