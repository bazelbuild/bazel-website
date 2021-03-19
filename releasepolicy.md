---
layout: contribute
title: Release Policy
---

# Release policy

We regularly publish [binary releases of Bazel](https://github.com/bazelbuild/bazel/releases).

A release candidate for a new MINOR version of Bazel is usually created at the beginning of
every month. The work is tracked by a
[release bug on GitHub](https://github.com/bazelbuild/bazel/issues?q=is%3Aissue+is%3Aopen+label%3Arelease)
indicating a target release date, and is assigned to the current Release manager.
Release candidates should pass all our unit tests, and show no unwanted regression in the
projects tested on [Buildkite](https://buildkite.com/bazel).

Release candidates are announced on [bazel-discuss](https://groups.google.com/forum/#!forum/bazel-discuss).
Over the next days, the Bazel team monitors community bug reports for any regressions in the candidates.

If no regressions are discovered, the candidate is officially released after one week. However,
regressions can delay the release of a release candidate. If regressions are found, the Bazel team applies
corresponding cherry-picks to the release candidate to fix those regressions. If no further
regressions are found for two business days, but not before one week has elapsed since the first
release candidate, the candidate is released.

New features are not cherry-picked into a release candidate after it is cut.
Moreover, if a new feature is buggy, the feature may be rolled back from a
release candidate. Only critical, high-impact bugs will be fixed in a release candidate.

A release is only released on a day where the next day is a business day.

If a critical issue is found on the latest release, a patch release can be emitted by applying the
corresponding cherry-pick to the release tag. Being another patch to an existing release, the
release candidate for a patch release can be released after 2 business days.

### Testing

A nightly build of all projects running on [ci.bazel.build](https://ci.bazel.build/) is run, using Bazel
binaries built at head, and release binaries. Projects going to be impacted by a
breaking change are notified. Google's internal continuous integration tests run all applicable build targets
at Google nightly.

When a release candidate is issued, other Google projects like [TensorFlow](https://tensorflow.org)
are tested on their complete test suite using the release candidate binaries. If you have a critical project
using Bazel, we recommend that you establish an automated testing process that tracks the current
release candidate, and report any regressions.
