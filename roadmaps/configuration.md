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
</style>

# Bazel Configurability 2018 Roadmap

*Last verified: 2018-10-18* ([update history]
(https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/configuration.md))

*Point of contact:* [gregestren](https://github.com/gregestren)
*Discuss:*  [Configurability 2018 Roadmap: discussion](https://github.com/bazelbuild/bazel/issues/6431)

## Goal

Configurability's goal is to make Bazel a graceful multiplatform build
tool. It also focuses on how users decide how their projects are built.


This translates into the following high-level goals:

1. **`$ bazel {build|test} :all` just works**
    1. All targets "know" how to build for the right platforms with the right
       toolchains and desired options
    1. <div class="padbottom">Users only have to fiddle with options they care
       about</div>

1. **"Platforms" is a first-class concept**
    1. "Platforms" and "toolchains" are well-defined, map well to reality, and are
        easy to create
    1. <div class="padbottom">Builds, build rules, remote executors, etc.
       naturally integrate platforms</div>

1. **Users decide what to configure**

    `$ bazel build //myapp:fancy_edition` automatically builds my app with
    "fancy" features

1. **Users decide what rules to configure**
    1. e.g. "*all foo rules use the foo toolchain*"
    1. All rules can have multiplatform dependencies
    1. <div class="padbottom">All configuration can be encoded in Starlark or
    BUILD files</div>

1. **Builds stay fast and efficient**
    1. Multiplatform builds don't duplicate platform-agnostic work
    1. Building "foo" in distinct configurations produces distinct output paths
    1. Builds remain cross platform-cacheable and remote execution-friendly
    1. Users have robust tools to understand multiplatform effects

## Roadmap

Dates are approximate based on our best understanding of problem complexity
and developer availability. ETAs will change, but we'll keep them refreshed and
current.

### Platforms
There's a more detailed [Platforms Roadmap](platforms.html) available with more details on ongoing subprojects.

<div class="etabox">June 2018</div>**Rules can declare what kinds of machines
they can build on**
<span class="donestatus">DONE</span> ([#5217](http://github.com/bazelbuild/bazel/issues/5217))

* Because of remote execution, this might not be the same machine Bazel runs on


<div class="etabox">Dec 2018</div>**C++ rules fully support
[platforms](https://docs.bazel.build/versions/master/platforms.html) and
[toolchains](https://docs.bazel.build/versions/master/toolchains.html)**
<span class="inprogressstatus">IN PROGRESS</span>

* This gives them first-class Starlark support, `select()` [on
platforms](https://docs.bazel.build/versions/master/be/general.html#config_setting.constraint_values),
and configuration via
[--platforms](https://docs.bazel.build/versions/master/platforms.html#specifying-a-platform-for-a-build)
* These set best practice templates for adoption by other rules


<div class="etabox">Dec 2018</div>**"Toolchain modes" support same-platform
toolchain configuration**

* Examples: debug vs. opt, C++ [correctness
  sanitizers](https://github.com/google/sanitizers)


<div class="etabox">2019</div>**There's _one_, simple way to choose platforms
at the command line**

* `$ bazel build //a:foo_lang_rule --platforms=//platforms:mac`
* `--cpu`, `--host_cpu`, `--crosstool_top`, `--javabase`,
  `--apple_crosstool_top`, etc. are obsolete and trigger deprecation warnings


<div class="etabox">2019</div>**Flagless multiplatform builds
(unoptimized)**

* ```sh
        $ cat a/BUILD
        cc_binary(name = "app_for_linux", platforms = ["//platforms:linux"])
        cc_binary(name = "app_for_mac", platforms = ["//platforms:mac"])

        $ bazel build //a:all # No command line flags!
  ```

* Platform-independent deps (e.g. Java libraries) may be built twice: see
    [Correctness and Speed](#correctness_and_speed) below


<div class="etabox">2019</div>**Java, Android, Apple rules fully support platforms and
toolchains**

* These depend on Java and C++, so need to happen after those rules
* `--android_sdk`, -`-ios_sdk_version`, etc. are deprecated and obsolete


### [User-Defined Configuration](https://docs.google.com/document/d/1vc8v-kXjvgZOdQdnxPTaV0rrLxtP2XwnD2tAZlYJOqw/edit?usp=sharing)


<div class="etabox">Oct 2018</div>**Starlark supports platform transitions**
<span class="inprogressstatus">IN PROGRESS</span> ([#5574]
(http://github.com/bazelbuild/bazel/issues/5574))

* Rule designers can decide which rules target which platforms
* Rule designers can declare default target platforms
* Rule designers can have dependencies target different platforms than their
  parents


<div class="etabox">Dec 2018</div>**Starlark supports multi-architecture ("fat")
binaries**
<span class="inprogressstatus">IN PROGRESS</span> ([#5575]
(http://github.com/bazelbuild/bazel/issues/5575))

* Rule designers can write rules that bundle deps configured for multiple
  platforms


<div class="etabox">Jan 2019</div>**Starlark supports user-defined configuration
settings**
<span class="inprogressstatus">IN PROGRESS</span> ([#5577]
(http://github.com/bazelbuild/bazel/issues/5577))

* A standard API defines how to declare custom settings (consolidating [command
  line
  flags](https://docs.bazel.build/versions/master/command-line-reference.html),
  ["secret"
  flags](https://github.com/bazelbuild/bazel/blob/master/src/main/java/com/google/devtools/build/lib/rules/apple/AppleCommandLineOptions.java#L246),
  [--define](https://github.com/bazelbuild/bazel/blob/b3cf83cd20f30d77e6768de651a3e652f86d6f78/src/main/java/com/google/devtools/build/lib/analysis/config/BuildConfiguration.java#L423),
  [--features](https://source.bazel.build/bazel/+/master:src/main/java/com/google/devtools/build/lib/analysis/config/BuildConfiguration.java;l=835?q=file:BuildConfiguration.java),
  and [feature
  flags](https://github.com/bazelbuild/bazel/blob/d6a98282e229b311dd56e65b72003197120f299a/src/test/java/com/google/devtools/build/lib/rules/android/AndroidBinaryTest.java#L3107))

* All hard-coded Bazel flags can be migrated to this API. Actual migration may
  not have begun.
* End users (i.e. non-rule designers) can't customize settings. We want to start
  by seeing how far we can get with `--platforms` and [feature
  flags](https://github.com/bazelbuild/bazel/blob/d6a98282e229b311dd56e65b72003197120f299a/src/test/java/com/google/devtools/build/lib/rules/android/AndroidBinaryTest.java#L3107).


<div class="etabox">Jan 2019</div>**All native Bazel rules can be implemented
in Starlark**
<span class="inprogressstatus">IN PROGRESS</span> ([#5578]
(http://github.com/bazelbuild/bazel/issues/5578))

### Correctness and Speed


<div class="etabox">May 2018</div>**Users can manually tag rules to not
duplicate under <a
href="https://github.com/bazelbuild/bazel/blob/d6a98282e229b311dd56e65b72003197120f299a/src/test/java/com/google/devtools/build/lib/rules/android/AndroidBinaryTest.java#L3107">feature
flags</a>**
<span class="donestatus">DONE</span>

* This makes "feature customization" under Android binaries more efficient
* Non-Android dependencies won't duplicate due to Android-only changes


<div class="etabox">June 2018</div>**Bazel updates _fast_ on `--test_timeout`, etc. changes**
<span class="donestatus">DONE</span> ([#5579]
(http://github.com/bazelbuild/bazel/issues/5579))

* Oct 2018: Must be enabled with [`--trim_test_configurarion`](https://github.com/bazelbuild/bazel/blob/f29f78d19288f6d6e7aea6bc65e6bfa01b2531ad/src/main/java/com/google/devtools/build/lib/analysis/test/TestConfiguration.java#L121~)


<div class="etabox">Dec 2018</div>**An experimental Bazel mode automatically
minimizes build graphs**
<span class="inprogressstatus">IN PROGRESS</span>

* No rule builds twice due to unrelated flag changes


<div class="etabox">Dec 2018</div>**User documentation provides clear guidance
on "safe" [Starlark transitions](#user-defined-configuration) use**
<span class="inprogressstatus">IN PROGRESS</span>

* Explains the risks of performance and memory regressions
* Explains how to minimize these risks and make informed use of the feature
* Explains how to track improvements and report problemns


<div class="etabox">2019</div>**Java compilation doesn't include cpu in its
output paths**
<span class="inprogressstatus">IN PROGRESS</span>

* This improves multiplatform build times and cross-build cacheability
* This is conditional on the impact of generated sources,
  [selects](https://docs.bazel.build/versions/master/be/functions.html#select)(),
  etc.


<div class="etabox">2019</div>**Distinct actions can't write to the same
output path**
<span class="inprogressstatus">IN PROGRESS</span>

* This prevents "output clobbering" when the same command is invoked twice with
  different inputs, producing different versions of the same output
* This is especially important for Starlark rules


<div class="etabox">2019</div>**Bazel automatically minimizes graphs over
feature flag changes**
<br><br>

<div class="etabox">2019</div>**Bazel automatically minimizes graphs over
all configuration changes**

* This productionizes the experimental minimization mode


<div class="etabox">2019</div>**Build actions cache efficiently**

* Content-identical outputs have the same file name (as much as possible)
* Output paths don't include cache-poisoning segments.:
  `bazel-out/ppc-fastbuild/PlatformIndependentModule.class`
