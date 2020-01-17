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

# Bazel Configurability 2020 Roadmap

*Last verified: 2020-01-17* ([update history](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/configuration.md))

*Point of contact:* [gregestren](https://github.com/gregestren)

*Discuss:*  [Configurability roadmap: discussion](https://github.com/bazelbuild/bazel/issues/6431)

## Previous Roadmaps

* [2019](2019/configuration.html) (w/ EOY review)
* [2018](2018/configuration.html)

## Goal

`$ bazel build //:all` *just works*, for any project and any targeted platforms.

* Builds don't require command-line flags.
* Each target automatically uses correct settings (e.g. `android_binary` uses the right NDK).
* It's easy to target multiple platforms.
* Dependencies can be configured differently than their parents.
* Builds scale well, particularly w.r.t graph size and action caching.

We also support
[`cquery`](https://docs.bazel.build/versions/master/cquery.html), [`Starlark
configuration`](https://docs.bazel.build/versions/master/skylark/config.html),
and
[`select()`](https://docs.bazel.build/versions/master/configurable-attributes.html).

## Roadmap

Dates are approximate based on our best understanding of problem complexity
and developer availability. Dates represent expected availability in released
Bazel. If a feature requires an [incompatible
flag](https://docs.bazel.build/versions/master/backward-compatibility.html#incompatible-changes-and-migration-recipes),
dates represent the first time the feature can be used, even if the flag has to
be manually set. ETAs will change, but we'll keep them refreshed as we best
understand them.

### Platforms
Also see the [Platforms Roadmap](platforms.html) for detailed priorities.

<div class="padbottom"></div>
<span class="etabox">mid 2020</span>**C++ rules use the new [platforms
API](https://docs.bazel.build/versions/master/platforms-intro.html)** 
<span class="inprogressstatus">IN PROGRESS</span> ([#6516](https://github.com/bazelbuild/bazel/issues/6516))

* This gives them first-class Starlark support, `select()` [on
platforms](https://docs.bazel.build/versions/master/be/general.html#config_setting.constraint_values),
and configuration via
[-\-platforms](https://docs.bazel.build/versions/master/platforms.html#specifying-a-platform-for-a-build)
* Sets best practices for adding platform and toolchain support to other rules


<div class="padbottom"></div>
<span class="etabox">mid 2020</span>**Java rules fully support
[platforms](https://docs.bazel.build/versions/master/platforms.html) and
[toolchains](https://docs.bazel.build/versions/master/toolchains.html)**
<span class="inprogressstatus">IN PROGRESS</span> ([#6521](https://github.com/bazelbuild/bazel/issues/6521))

<div class="padbottom"></div>
<span class="etabox">Jun 2019</span>**There's _one_ standard way to select platforms
at the command line**
[see status](https://bazel.build/roadmaps/platforms.html#replace---cpu-and---host_cpu-flags) ([#6518](https://github.com/bazelbuild/bazel/issues/6518))

* `$ bazel build //a:myrule --platforms=@bazel_tools/platforms:mac`
* `--cpu`, `--host_cpu`, `--crosstool_top`, `--javabase`, `--apple_crosstool_top`, etc. are deprecated


<div class="padbottom"></div>
<span class="etabox">Jun 2019</span>**Legacy flags like `--cpu` automatically set `--platform` while the former are removed**
<span class="inprogressstatus">IN PROGRESS</span> ([#6426](https://github.com/bazelbuild/bazel/issues/6426))

* This prevents `.bazelrc`s, `select()`s on `--cpu`, and legacy command lines from breaking as rules adopt platforms
* Rules can get platforms' benefits without having to wait on migration

<div class="padbottom"></div>
<span class="etabox">late 2020</span>**Android and iOS rules support 
[platforms](https://docs.bazel.build/versions/master/platforms.html) and
[toolchains](https://docs.bazel.build/versions/master/toolchains.html)**
<span class="inprogressstatus">IN PROGRESS</span>

* Python: [#7375](https://github.com/bazelbuild/bazel/issues/7375)

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
* *Unoptimized* means [memory and performance](#efficiency) issues may not be resolved

### Efficiency

<div class="padbottom"></div>
<span class="etabox">May 2019</span>**An experimental Bazel mode automatically
shrinks build graphs**
<span class="donestatus">DONE</span> ([#6524](https://github.com/bazelbuild/bazel/issues/6524))

* No rule builds twice when unrelated flags change
* Building the *Mac* and *Linux* versions of a binary at the same time doesn't double the build graph

<div class="padbottom"></div>
<span class="etabox">Jul 2019</span>**This mode automatically optimizes [test
trimming](https://github.com/bazelbuild/bazel/issues/5579) and [feature flags](https://github.com/bazelbuild/bazel/blob/d6a98282e229b311dd56e65b72003197120f299a/src/test/java/com/google/devtools/build/lib/rules/android/AndroidBinaryTest.java#L3107)**
<span class="inprogressstatus">IN PROGRESS</span> ([#6524](https://github.com/bazelbuild/bazel/issues/6524))

* No rule builds twice when unrelated flags change
* Building the *Mac* and *Linux* versions of a binary at the same time doesn't double the build graph


<div class="padbottom"></div>
<span class="etabox">Jul 2019</span>**An experimental Bazel mode makes identical actions unique**
<span class="inprogressstatus">IN PROGRESS</span> ([#6526](https://github.com/bazelbuild/bazel/issues/6526))

* Stops different actions from writing to the same path and overwriting each other's output
* Improves multiplatform build time and remoe execution caching
* Makes pure Java compilation cacehable across different CPUs.


<div class="padbottom"></div>
<span class="etabox">Jul 2019</span>**Projects can selectively opt into automatic shareable actions**
<span class="notstartedstatus">NOT STARTED</span> ([#6526](https://github.com/bazelbuild/bazel/issues/6526))

* Exposes the benefits of experimental unique actions while recognizing complete migration may take time


<div class="padbottom"></div>
<span class="etabox">Jul 2019</span>**Documentation explains how to use
[configuration transitions](#user-defined-build-settings) efficiently**
<span class="notstartedstatus">NOT STARTED</span> ([#6525](https://github.com/bazelbuild/bazel/issues/6525))

* Explains why builds may use more memory and be slower
* Explains how to minimize this and make informed use of these features
* Points to tools for profiling your build
* Explains ongoing work to automatically improve efficiency


<div class="padbottom"></div>
<span class="etabox">late 2019</span>**Bazel automatically shrinks graphs with
mixed build settings**
<span class="notstartedstatus">NOT STARTED</span> ([#6524](https://github.com/bazelbuild/bazel/issues/6524))

* Productionizes experimental build graph shrinking
