---
layout: contribute
title: Android roadmap
---

# Android Roadmap

*Last verified: 2018-07-21*
([update history](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/android.md))

**Points of contact:** [ahumesky](https://github.com/ahumesky), [jingwen](https://github.com/jin)

## Overview

Bazel is capable of building Android apps using the [Android
rules](https://docs.bazel.build/versions/master/be/android.html). Blaze, the
Google build tool that Bazel is open-sourced as, is used to build Google apps
such as YouTube, Google Maps, and Gmail.

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

As of Q3 2018, the native Android rules are incrementally rewritten and migrated
to [rules_android](https://github.com/bazelbuild/rules_android). With this, the
development of the Android rules can be decoupled from the core build system
development.

### Q3 2018

#### Build performance

- Publish a prototype continuous build performance dashboard for Android projects

#### Developer experience

- Document Android with Bazel compatibility across Windows, macOS and Linux.

#### NDK

- Document Android NDK support with Bazel.

#### Tooling (Build & Test)

- Support and default to D8 for dexing.
- Support and default to aapt2 for resource processing.
