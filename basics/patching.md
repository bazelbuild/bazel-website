---
layout: contribute
title: Patch acceptance process
---

# Patch Acceptance Process

This page outlines how contributors can propose and make changes to the Bazel code base.

1. Read the [Bazel Contribution policy](/governance.html).
1. Create a [GitHub issue](https://github.com/bazelbuild/bazel/) to
   discuss your plan and design. Pull requests that change or add behavior
   need a corresponding issue for tracking.
1. If you're proposing significant changes, write a [design document](/designs/index.html).
1. Ensure you've signed a [Contributor License
   Agreement](https://cla.developers.google.com).
1. Prepare a git commit that implements the feature. Don't forget to add tests
   and update the documentation. If your change has user-visible effects, please
   [add release notes](release-notes.html). If it is an incompatible change, read
   the [guide for rolling out breaking changes](/maintaining/breaking-changes-guide.html).
1. Create a pull request on
   [GitHub](https://github.com/bazelbuild/bazel/pulls). If you're new to GitHub,
   read [about pull
   requests](https://help.github.com/articles/about-pull-requests/). Note that
   we restrict permissions to create branches on the main Bazel repository, so
   you will need to push your commit to [your own fork of the
   repository](https://help.github.com/articles/working-with-forks/).
1. A Bazel maintainer should assign you a reviewer within two business days
   (excluding holidays in the USA and Germany). If you aren't assigned a
   reviewer in that time, you can request one by emailing
   [bazel-dev@googlegroups.com](mailto:bazel-dev@googlegroups.com).
1. Work with the reviewer to complete a code review. For each change, create a
   new commit and push it to make changes to your pull request. If the review
   takes too long (e.g. reviewer is unresponsive), send an email to
   [bazel-dev@googlegroups.com](mailto:bazel-dev@googlegroups.com).
1. After your review is complete, a Bazel maintainer applies your patch to Google's
   internal version control system.

   This triggers internal presubmit checks
   that may suggest more changes. If you haven't expressed a preference, the
   maintainer submitting your change  adds "trivial" changes (such as
   [linting](https://en.wikipedia.org/wiki/Lint_(software))) that don't affect
   design. If deeper changes are required or you'd prefer to apply
   changes directly, you and the reviewer should communicate preferences
   clearly in review comments.

   After internal submission, the patch is exported as a Git commit,
   at which point the GitHub pull request is closed. All final changes
   are attributed to you.
