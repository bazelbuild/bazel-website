---
layout: contribute
title: Android roadmap
---

# Android Roadmap

*Last verified: 2018-07-25*
([update history](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/android.md))

*Points of contact:* [ahumesky](https://github.com/ahumesky), [jingwen](https://github.com/jin)

## Overview

Bazel can build Android apps using the [Android
rules](https://docs.bazel.build/versions/master/be/android.html). Blaze,
Google's internal version of Bazel, is used internally at Google to build Google
apps such as YouTube, Google Maps, and Gmail.

Bazel has [integration with Android Studio via the IntelliJ
plugin](https://ij.bazel.build/). It also supports an [iterative development
mode with
`mobile-install`](https://docs.bazel.build/versions/master/mobile-install.html),
[building native C++ code with the Android
NDK](https://docs.bazel.build/versions/master/android-ndk.html), as well as
[Robolectric](https://docs.bazel.build/versions/master/be/android.html#android_local_test)
and [instrumentation
testing](https://docs.bazel.build/versions/master/android-instrumentation-test.html).

## Goal

Build and test Android apps of all sizes quickly and reliably.

## Roadmap 

This roadmap is a high level overview of planned features and fixes. See the
[tracking
spreadsheet](https://docs.google.com/spreadsheets/d/1-BjWLdv3SKGnEBOdLmzPPhTPNErRVMQerjrI60N_DVs/edit#gid=1123749242)
for a list of finer-grained tasks.

As of Q3 2018, the native Android rules are being incrementally rewritten and
migrated to [rules_android](https://github.com/bazelbuild/rules_android). With
this, the development of the Android rules can be decoupled from the core build
system development.

### Q3 2018

#### Build performance

- Publish a prototype continuous build performance dashboard for Android projects.

#### Developer experience

- Document Android with Bazel compatibility across Windows, macOS and Linux.
- Introduce a best-practices documentation on configuring your Android build.
- Introduce `tools_android` repository for common Android build tools for use
  with Bazel (e.g. Firebase, Google Play Services)
- Add Bazel support to [OkBuck](https://github.com/uber/okbuck).

#### NDK

- Document Android NDK support with Bazel. ([Documentation](https://docs.bazel.build/versions/master/android-ndk.html), [Commit](https://github.com/bazelbuild/bazel/commit/e169b94ce9b0e964b8edd231ef7eb3bed1cd2ccf#diff-64a8f141fa31bcfadcd36fa00be7872b))
- Add support for NDK r17. ([#4742](https://github.com/bazelbuild/bazel/issues/4742))
- Add support for [NDK r18 beta](https://github.com/android-ndk/ndk/wiki#ndk-r18). ([#5585](https://github.com/bazelbuild/bazel/issues/5585))

#### Tooling (Build & Test)

- Support Databinding 3.2.0 (v2). ([#2694](https://github.com/bazelbuild/bazel/issues/2694))
- Support ([#5150](https://github.com/bazelbuild/bazel/issues/5150)) and default to D8 for dexing.
- Support ([#5214](https://github.com/bazelbuild/bazel/issues/5214)) and default to aapt2 ([#4103](https://github.com/bazelbuild/bazel/issues/4103)) for resource processing.

### Q4 2018 and later

#### Developer experience

- Replace `bazel mobile-install` in favor of its Skylark reimplementation,
  mobile-install v2, which has better performance and works with instrumentation
  tests.
- Interoperability with Kotlin

#### Rules

- Introduce `android_archive` rule to build AARs from `android_library` targets.
