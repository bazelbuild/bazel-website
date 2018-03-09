---
layout: contribute
title: Roadmap
---

# Bazel Feature Roadmap

This document describes the Bazel team's plans for introducing features. Note
that this roadmap only includes features that the Bazel team itself intends
to support. We anticipate that a number of other features will be added by
code contributors.

In the following list, each feature is associated with a corresponding
milestone. The convention for the priorities are:

*   P0 feature will block the milestone; we will delay the milestone date
    until the feature is shipped.
*   P1 feature can delay the milestone if the feature can be shipped with a
    reasonable delay.
*   P2 feature will be dropped and rescheduled for later rather than delaying
    the milestone.

We will update this list when reaching each milestone; some milestones may also
be refined if appropriate.

## Planned feature list

### 1.0

#### Stable API

* P0. List of feature to deprecate until version 1.0 are tracked in a publicly available document
* P0. APIs are defined and versioned
* P0. Main APIs are stable: Skylark, remote execution, platform description, build language, Build Event Protocol
* P0. Deprecated features are removed
* P1. Support policy is defined regarding LTS release

#### Windows

* P0. Bazel on Windows does not need to install MSYS
* P0. Feature parity for Android, Java, C++, Python on Windows

#### Migration / External repositories / Interfacing with other build systems

* P0. Migration tool: Maven project to Bazel project
* P1. Bazel can load workspace recursively
* P1. All external repositories can use the local cache which turned on by default and has a deletion strategy
* P1. Push to Maven public and private artifact repositories
* P2. Repository of BUILD files for third party OSS libraries open to the community

#### Skylark

* P0. Skylark is fully documented; strategy for user-provided Skylark rule documentation
* P0. Support for coverage can be extended in Skylark
* P0. Support for testing Skylark rules

#### Mobile rules

* P0. Support for Android testing: integration and robolectric tests
* P0. Bazel can build Android application on Windows
* P0. Support for iOS testing

#### Native rules

* P0. Access to native rules functionality from Skylark ("sandwich")
* P0. C++ coverage support

#### Performance

* P1. Local caching of build artifacts
* P2. Bazel is benchmarked publicly by third parties.
* P2. Minimize need for manual user config to make Bazel fast

#### Misc

* P1. Better CLI output (`--experimental_ui` is enabled by default)
* P1. Full test suite is open-sourced
* P1. Public review process for design documents

#### 1.x (LTS)

* P0. Google uses only public APIs of Bazel
* P0. Github is the primary code repository
* P1. Support policy is defined regarding LTS release
* P1. Bazel respects the standard for Debian packaging
* P2. Bazel is in the list of Debian package for the next stable



## Releases

We publish releases on [Github](https://github.com/bazelbuild/bazel/releases).


## Code location

For the alpha and beta releases, the Bazel team will maintain two code
repositories:

*   A Google-internal repository, containing both Bazel code and
    Google-specific extensions and features
*   An external [GitHub repository](https://github.com/bazelbuild/bazel),
    containing only the Bazel code.

We anticipate making the external repository *primary* in the future, that is,
code from Google and non-Google contributors will be committed and tested in the
external repository first, then imported into the internal repository. For
the alpha and beta releases, however, the internal repository will be primary.
Changes to Bazel code will be frequently pushed from the internal to
the external repository.
