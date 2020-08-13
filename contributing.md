---
layout: contribute
title: Contributing to Bazel
---

# Contributing to Bazel


## How can I help?

There are many ways to help the Bazel project and ecosystem.

1. Provide feedback as you use Bazel. As you use it, you may find things
   that can be improved. Please report them:
   - Report bugs. In particular, it's important to report any crash or
     correctness bug.
   - Report issues when the documentation is incomplete or unclear.
   - Report issues when an error message could be improved.

1. As you get experienced with Bazel, engage with the community:
   - Answer questions [on Stack Overflow](
     https://stackoverflow.com/questions/tagged/bazel).
   - Help other users [on Slack](https://slack.bazel.build).
   - Improve the documentation or [contribute examples](
     https://github.com/bazelbuild/examples).
   - Share your experience or your tips, for example on a blog or social media.

1. Contribute to the Bazel ecosystem:
   - Help rules maintainers by contributing pull requests.
   - Create new rules and open-source them.
   - Contribute to Bazel-related tools, for example migration tools.
   - Improve Bazel integration with other IDEs and tools.


## How can I contribute to Bazel source code?

Bazel is a large project and making a significant change to Bazel source code
can be difficult. Please check with us on the [dev list](
https://groups.google.com/forum/#!forum/bazel-dev) or on a GitHub issue before
investing a lot of time in a patch.

In general, we prefer contributions that fix bugs or add features (as opposed to
stylistic, refactoring, or "cleanup" changes). When making a change, please
include tests and documentation, and keep in mind backward-compatibility,
portability, as well as the impact on memory usage and performance.

See [getting started](basics/getting_started.md) for learning how to work on the
code base, and the [patch acceptance process](basics/patching.md) for sending
your contribution.
