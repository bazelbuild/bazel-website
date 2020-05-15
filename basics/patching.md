---
layout: contribute
title: Patch acceptance process
---

# Patch Acceptance Process

1. Read the [Bazel governance plan](/governance.html).
1. Discuss your plan and design, and get agreement on a GitHub issue or our
   [mailing list](https://groups.google.com/forum/#!forum/bazel-dev).
1. PRs that change or add behavior are not accepted without being tied to an
   issue.
1  Significant changes need a [design document](/designs/index.html).
1. Prepare a git commit that implements the feature. Don't forget to add tests.
1. Ensure you've signed a [Contributor License
   Agreement](https://cla.developers.google.com).
1. Send us a pull request on
   [GitHub](https://github.com/bazelbuild/bazel/pulls). If you're new to GitHub,
   read [about pull
   requests](https://help.github.com/articles/about-pull-requests/). Note that
   we restrict permissions to create branches on the main Bazel repository, so
   you will need to push your commit to [your own fork of the
   repository](https://help.github.com/articles/working-with-forks/).
1. Wait for a Bazel team member to assign you a reviewer. It should be done in 2
   business days (excluding holidays in the USA and Germany). If you do not get
   a reviewer within that time frame, you can ask for one by sending a mail to
   [bazel-dev@googlegroups.com](mailto:bazel-dev@googlegroups.com).
1. Work with the reviewer to complete a code review. For each change, create a
   new commit and push it to make changes to your pull request. If the review
   takes too long (e.g. reviewer is unresponsive), please also send an email to
   [bazel-dev@googlegroups.com](mailto:bazel-dev@googlegroups.com).
1. A Bazel maintainer at Google will apply the patch to our internal version
   control system.

   This triggers [internal presubmit checks](https://bazel.build/governance.html#are-you-done-open-sourcing-bazel)
   that may suggest more changes. If you haven't expressed a preference, the
   submitter will automatically add "trivial" changes (like
   [linting](https://en.wikipedia.org/wiki/Lint_(software))) that don't affect
   design. If deeper changes are required or you'd prefer to apply
   changes directly, you and the reviewer should communicate preferences
   clearly in review comments.

   After internal submission, the patch is exported as a Git commit,
   at which point the GitHub pull request is closed. All final changes
   are attributed to you.

If your change has user-visible effects, please [add release notes](release-notes.html). If it is an incompatible change, read the [guide for
rolling out breaking changes](/maintaining/breaking-changes-guide.html).
