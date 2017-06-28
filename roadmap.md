---
layout: contribute
title: Roadmap
---

# Bazel Feature Roadmap

This document describes the Bazel team's plans for introducing features that
will be incorporated into version 1.0. Note that this roadmap only includes
features that the Bazel team itself intends to support. We anticipate that a
number of other features will be added by code contributors.

In the following list, each feature is associated with a corresponding
milestone. The convention for the priorities are:

*   P0 feature will block the milestone; we will delay the milestone date
    until the feature is shipped.
*   P1 feature can delay the milestone if the feature can be shipped with a
    reasonable delay (2 months max).
*   P2 feature will be dropped and rescheduled for later rather than delaying
    the milestone.

We will update this list when reaching each milestone; some milestones may also
be refined if appropriate.

## Planned feature list

#### 0.6
2017-06

* P0. Stable API for Remote execution including platform description
* P0. List of feature to deprecate until version 1.0 are tracked in a publicly available document
* P1. Bazel on Windows does not need to install MSYS
* P2. Bazel can load workspace recursively

#### 0.7
2017-09

* P0. Skylark is fully documented; strategy for user-provided Skylark rule documentation
* P0. Support for Android integration testing
* P0. Support for Robolectric test for Android
* P1. The Build Event Protocol is stable
* P1. Support for coverage can be extended in Skylark and C++
* P1. Support for testing Skylark rules
* P2. All external repositories can use the local cache
* P2. Local caching of build artifacts

#### 0.8
2017-12

* P0. Support for iOS integration testing
* P1. Bazel can build Android application on Windows
* P1. Local caching of external repository is turned on by default and has a deletion strategy
* P1. Access to native rules functionality from Skylark (/designs/2016/08/04/extensibility-for-native-rules.html["sandwich"]())

#### 0.9
2018-03

* P0. Full Windows support
* P1. Full test suite is open-sourced

### Stable

#### 1.0
2018-06

* P0. APIs are versioned
* P0. Github is primary
* P1. Deprecated features are removed
* P1. Support policy is defined regarding LTS release
* P1. Public review process for design documents
* P1. Bazel respects the standard for Debian packaging
* P2. Bazel is in the list of Debian package for the next stable


## Previously released

### Alpha
Released 2015-03-24

* Linux &amp; OS X Support</td>
* C++ ([build](http://bazel.build/docs/be/c-cpp.html#cc_binary) and [test](http://bazel.build/docs/be/c-cpp.html#cc_test))
* Java ([build](http://bazel.build/docs/be/java.html#java_binary) and [test](http://bazel.build/docs/be/java.html#java_test))
* Objective-C for iOS ([build](http://bazel.build/docs/be/objective-c.html#objc_binary))
* Python ([build](http://bazel.build/docs/be/python.html#py_binary))
* iOS applications ([build](http://bazel.build/docs/be/objective-c.html#ios_application))
* Skylark extension mechanism ([build](http://bazel.build/docs/skylark/index.html))
* Basic test suite on GitHub
* Support for fetching dependencies from [Maven repositories](http://bazel.build/docs/be/workspace.html#maven_jar) and [web servers](http://bazel.build/docs/be/workspace.html#http_archive)


### Beta

#### [0.1](https://github.com/bazelbuild/bazel/releases/tag/0.1.0)
Released 2015-09-01

* P0. Binary distribution for Linux & OS X
* P0. Public [continuous integration system](http://ci.bazel.build)
* P0. Support for [fetching transitive dependencies from Maven Central](http://bazel.build/docs/external.html)
* P0. Android application ([build](http://bazel.build/docs/be/android.html#android_binary) and [install](http://bazel.build/docs/bazel-user-manual.html#mobile-install))
* P1. Support for [prefetching and caching remote dependencies](http://bazel.build/docs/external.html)
* P1. Docker support
* P1. [IntelliJ plugin](https://ij.bazel.build/)
* P2. [Sandboxing of actions for Linux](http://bazel.build/docs/bazel-user-manual.html#sandboxing)

#### [0.2](https://github.com/bazelbuild/bazel/releases/tag/0.2.0)
Released 2016-02-18

* P0. [Significantly increase test coverage](https://github.com/bazelbuild/bazel/tree/master/src/test/java/com/google/devtools)
* P0. Support for fetching [remote](http://bazel.build/docs/external.html) [Skylark rules](http://bazel.build/docs/be/functions.html#load)
* P2. [Go language support (build and tests)](https://github.com/bazelbuild/rules_go)
* P2. [Debian packages for Bazel](https://github.com/bazelbuild/bazel/releases/latest)
* P2. [OS X homebrew recipe for distributing Bazel](http://braumeister.org/formula/bazel)

#### [0.3](https://github.com/bazelbuild/bazel/releases/tag/0.3.0)
Released 2016-06-10

* P0. [Bazel can bootstrap itself on Windows without requiring admin privileges](http://bazel.build/docs/windows.html)
* P1. [Interface for IDE support](http://blog.bazel.build/2016/06/10/ide-support.html)
* P1. IDE support for [Xcode (stable)](http://tulsi.bazel.build) and [Eclipse (experimental)](https://github.com/bazelbuild/e4b)
* P1. [Custom remote repositories using Skylark](https://docs.google.com/document/d/1jKbNXOVp2T1zJD_iRnVr8k5D0xZKgO8blMVDlXOksJg)
* P2. [[Prototype for distributed caching of build artifact](https://github.com/bazelbuild/bazel/commit/79adf59e2973754c8c0415fcab45cd58c7c34697)]()

#### [0.4](https://github.com/bazelbuild/bazel/releases/tag/0.4.0)
Released 2016-11-02

* P0. [Persistent Java compiler is enabled](https://github.com/bazelbuild/bazel/commit/490f250b27183a886cf70a5fe9e99d9428141b34)
* P2. [Sandboxing of action for OS X](https://github.com/bazelbuild/bazel/commit/7b825b8ea442246aabfa6a5a8962abd70855d0da)


#### [0.5](https://github.com/bazelbuild/bazel/releases/tag/0.5.0)
Released 2017-05-26

* P0. Support for building and testing Java, C++ and Python on Windows</td>
* P1. Initial API for a Build Event Protocol
* P1. Support for coverage for Java
* P1. Bazel installer optionally bundles the JDK
* P2. Repository rules no longer have invalidation issues

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
