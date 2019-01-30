---
layout: contribute
title: Bazel Configurability Roadmap
---
<style>
  .padbottom { padding-bottom: 10px; }
  .etabox {
    background: #EFEFEF;
    color: #38761D;
    font-size: 15px;
    font-weight: bold;
    display: inline;
    padding: 6px;
    margin-right: 10px;
  }
  .donestatus {
    color: #00D000;
    font-weight: bold;
    padding-left: 10px;
  }
  .inprogressstatus {
    color: #D0D000;
    font-weight: bold;
    padding-left: 10px;
  }
  .notstartedstatus {
    color: #D00000;
    font-weight: bold;
    padding-left: 10px;
  }
</style>

# Bazel Configurability 2019 Roadmap

*Last verified: 2019-01-28* ([update history](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/configuration.md))

*Point of contact:* [gregestren](https://github.com/gregestren)

*Discuss:*  [Configurability roadmap: discussion](https://github.com/bazelbuild/bazel/issues/6431)

## Previous

* [Bazel Configurability 2018 Roadmap](2018/configuration.html)

## Goal

**`$ bazel build :all`** ***just works***, for whatever platform(s) you build for.

* Targets "know" how to build themselves. For example, an `android_binary` automatically chooses the right SDK.
* Builds don't require command-line flags.
* Any target can be built with any other. For example, a binary's *Mac* and *Linux* versions can be built in the same command.
* Dependencies can build differently than their parents. For example, a test builds helper binaries without debug symbols.
* All rule logic and related flags are user-defined. Nothing requires a Bazel release.
* Builds can target any platform or any mix of platforms. Nothing requires a Bazel release.
* These features scale well for large builds.

## Roadmap

Dates are approximate based on our best understanding of problem complexity
and developer availability. ETAs will change, but we'll keep them refreshed and
current.

### Platforms
Also see the [Platforms Roadmap](platforms.html) for detailed priorities.

<div class="padbottom"></div>
<span class="etabox">Jun 2019</span>**C++ rules fully support
[platforms](https://docs.bazel.build/versions/master/platforms.html) and
[toolchains](https://docs.bazel.build/versions/master/toolchains.html)**
<span class="inprogressstatus">IN PROGRESS</span> ([#6516](https://github.com/bazelbuild/bazel/issues/6516))

* This gives them first-class Starlark support, `select()` [on
platforms](https://docs.bazel.build/versions/master/be/general.html#config_setting.constraint_values),
and configuration via
[-\-platforms](https://docs.bazel.build/versions/master/platforms.html#specifying-a-platform-for-a-build)
* These set best practice templates for adding platform and toolchain support to other rules


<div class="padbottom"></div>
<span class="etabox">Jun 2019</span>**Java rules fully support
[platforms](https://docs.bazel.build/versions/master/platforms.html) and
[toolchains](https://docs.bazel.build/versions/master/toolchains.html)**
<span class="inprogressstatus">IN PROGRESS</span> ([#6521](https://github.com/bazelbuild/bazel/issues/6521))

* A second major rule set adopts this API


<div class="padbottom"></div>
<span class="etabox">Jun 2019</span>**There's _one_ standard way to select platforms
at the command line**
[see status](https://bazel.build/roadmaps/platforms.html#replace---cpu-and---host_cpu-flags) ([#6518](https://github.com/bazelbuild/bazel/issues/6518))

* `$ bazel build //a:myrule --platforms=@bazel_tools/platforms:mac`
* `--cpu`, `--host_cpu`, `--crosstool_top`, `--javabase`, `--apple_crosstool_top`, etc. are deprecated


<div class="padbottom"></div>
<span class="etabox">Jun 2019</span>**Legacy flags like `--cpu` automatically set `--platform` while the former are removed**
<span class="notstartedstatus">NOT STARTED</span> ([#6426](https://github.com/bazelbuild/bazel/issues/6426))

* This prevents `.bazelrc`s, `select()`s on `--cpu`, and legacy command lines from breaking as rules adopt platforms
* Rules can leverage the benefits of platforms without having to wait on migration


<div class="padbottom"></div>
<span class="etabox">late 2019</span>**Flagless multiplatform builds
(unoptimized)**
<span class="notstartedstatus">NOT STARTED</span> ([#6519](https://github.com/bazelbuild/bazel/issues/6519))

* ```sh
        $ cat a/BUILD
        cc_binary(name = "app_for_linux", platforms = ["//platforms:linux"])
        cc_binary(name = "app_for_mac", platforms = ["//platforms:mac"])

        $ bazel build //a:all # No command line flags!
  ```
* *Unoptimized* means [memory and performance](#memory-and-performance) issues may not be resolved


<div class="padbottom"></div>
<span class="etabox">late 2019</span>**All supported Bazel rules fully support 
[platforms](https://docs.bazel.build/versions/master/platforms.html) and
[toolchains](https://docs.bazel.build/versions/master/toolchains.html)**
<span class="notstartedstatus">NOT STARTED</span>


### User-Defined Build Settings
See [Starlark Build Configuration](https://docs.google.com/document/d/1vc8v-kXjvgZOdQdnxPTaV0rrLxtP2XwnD2tAZlYJOqw/edit?usp=sharing) for in-depth motivation and design.

<div class="padbottom"></div>
<span class="etabox">Mar 2019</span>**Starlark supports custom configuration transitions**
<span class="inprogressstatus">IN PROGRESS</span> ([#5574](http://github.com/bazelbuild/bazel/issues/5574))

* Rule designers can have rules change their flags or their dependencies' flags
* This may have [memory and performance](#memory-and-performance) consequences


<div class="padbottom"></div>
<span class="etabox">Apr 2019</span>**Starlark supports [fancy](https://docs.google.com/document/d/1VIRx06cZB4wLU-ASq1XKFHmx67yfHtNOCbCempaPeaA/edit) transitions**
<span class="inprogressstatus">IN PROGRESS</span> ([#5574](http://github.com/bazelbuild/bazel/issues/5574))

* Transitions can read a rule's attributes to determine what to change
* Transitions on a rule can read attributes with `select()`


<div class="padbottom"></div>
<span class="etabox">Apr 2019</span>**Starlark supports user-defined build settings**
<span class="inprogressstatus">IN PROGRESS</span> ([#5577](http://github.com/bazelbuild/bazel/issues/5577))

* A standard API defines how to declare custom settings. This consolidates [command
  line
  flags](https://docs.bazel.build/versions/master/command-line-reference.html),
  ["secret"
  flags](https://github.com/bazelbuild/bazel/blob/master/src/main/java/com/google/devtools/build/lib/rules/apple/AppleCommandLineOptions.java#L246),
  [--define](https://github.com/bazelbuild/bazel/blob/b3cf83cd20f30d77e6768de651a3e652f86d6f78/src/main/java/com/google/devtools/build/lib/analysis/config/BuildConfiguration.java#L423),
  [--features](https://source.bazel.build/bazel/+/master:src/main/java/com/google/devtools/build/lib/analysis/config/BuildConfiguration.java;l=835?q=file:BuildConfiguration.java),
  and [feature
  flags](https://github.com/bazelbuild/bazel/blob/d6a98282e229b311dd56e65b72003197120f299a/src/test/java/com/google/devtools/build/lib/rules/android/AndroidBinaryTest.java#L3107)).

* All hard-coded Bazel flags can be migrated to this API. Actual migration may
  not have begun.
* End users (i.e. non-rule designers) can't customize settings. For end users, we want to start
  by seeing how far we can get with [`--platforms`](https://docs.bazel.build/versions/master/platforms.html#specifying-a-platform-for-a-build) and [feature
  flags](https://github.com/bazelbuild/bazel/blob/d6a98282e229b311dd56e65b72003197120f299a/src/test/java/com/google/devtools/build/lib/rules/android/AndroidBinaryTest.java#L3107).


<div class="padbottom"></div>
<span class="etabox">Apr 2019</span>**All native Bazel rules can be implemented
in Starlark**
<span class="inprogressstatus">IN PROGRESS</span> ([#5578](http://github.com/bazelbuild/bazel/issues/5578))

* This automatically comes out of user-defined build settings and custom transitions


### Memory and Performance

<div class="padbottom"></div>
<span class="etabox">Mar 2019</span>**Documentation explains how to use
[configuration transitions](#user-defined-build-settings) efficiently**
<span class="notstartedstatus">NOT STARTED</span> ([#6525](https://github.com/bazelbuild/bazel/issues/6525))

* Explains why builds may use more memory and take more time
* Explains how to minimize these risks and make informed use of these features
* Points to tools for profiling your build
* Explains ongoing work to automatically improve efficiency


<div class="padbottom"></div>
<span class="etabox">May 2019</span>**An experimental Bazel mode automatically
shrinks build graphs**
<span class="inprogressstatus">IN PROGRESS</span> ([#6524](https://github.com/bazelbuild/bazel/issues/6524))

* No rule builds twice when unrelated flags change
* Building the *Mac* and *Linux* versions of a binary at the same time doesn't double the build graph


<div class="padbottom"></div>
<span class="etabox">Jul 2019</span>**An experimental Bazel mode makes identical actions unique**
<span class="notstartedstatus">NOT STARTED</span> ([#6526](https://github.com/bazelbuild/bazel/issues/6526))

* Stops different actions from writing to the same path and overwriting each other's output
* Improves multiplatform build time and remoe execution caching
* Makes pure Java compilation cacehable across different CPUs.


<div class="padbottom"></div>
<span class="etabox">late 2019</span>**Bazel automatically shrinks graphs with
mixed build settings**
<span class="notstartedstatus">NOT STARTED</span> ([#6524](https://github.com/bazelbuild/bazel/issues/6524))

* Productionizes experimental build graph shrinking


<div class="padbottom"></div>
<span class="etabox">late 2019</span>**Projects can selectively opt into automatic shareable actions**
<span class="notstartedstatus">NOT STARTED</span> ([#6526](https://github.com/bazelbuild/bazel/issues/6526))

* Exposes the benefits of experimental unique actions while recognizing complete migration may take time


