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

*Last verified: 2020-05-04* ([update history](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/configuration.md))

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

<div class="padbottom"></div>
<span class="etabox">Q1 2020</span>**Toolchains can build for both target and
exec platforms**
<span class="inprogressstatus">IN PROGRESS</span> ([#10523](https://github.com/bazelbuild/bazel/issues/10523))

<div class="padbottom"></div>
<span class="etabox">Q2 2020</span>**Builds support [multiple execution
platforms](https://docs.google.com/document/d/1U9HzdDmtRnm244CaRM6JV-q2408mbNODAMewcGjnnbM/)**
<span class="inprogressstatus">IN PROGRESS</span>

<div class="padbottom"></div>
<span class="etabox">mid 2020</span>**C++ rules use the new [platforms
API](https://docs.bazel.build/versions/master/platforms-intro.html)** 
<span class="inprogressstatus">IN PROGRESS</span> ([#6516](https://github.com/bazelbuild/bazel/issues/6516))

* Already [ready](https://github.com/bazelbuild/bazel/issues/7260) but need
  [platform
  mappings](https://docs.bazel.build/versions/master/platforms-intro.html#how-to-use-platforms-today)
  to [support](507230303) Android/IOS projects

<div class="padbottom"></div>
<span class="etabox">mid 2020</span>**Java rules use the new [platforms
API](https://docs.bazel.build/versions/master/platforms-intro.html)**
<span class="inprogressstatus">IN PROGRESS</span> ([#6521](https://github.com/bazelbuild/bazel/issues/6521))

* Same as C++ but also need [platform definitions](https://github.com/bazelbuild/rules_java/pull/8)

<div class="padbottom"></div>
<span class="etabox">late 2020</span>**Help Android, iOS rule owners support the
new [platforms
API](https://docs.bazel.build/versions/master/platforms-intro.html)**
<span class="notstartedstatus">NOT STARTED</span>

<div class="padbottom"></div>
<span class="etabox">mid 2020</span>**`bazel build //:all` [automatically skips](https://docs.google.com/document/d/12n5QNHmFSkuh5yAbdEex64ot4hRgR-moL1zRimU7wHQ/edit?ts=5dfbe2fe)
platform-incompatible targets**
<span class="inprogressstatus">IN PROGRESS</span> ([PR 10945](https://github.com/bazelbuild/bazel/pull/10945))

<div class="padbottom"></div>
<span class="etabox">2021</span>**Deprecate and remove `--cpu` and related flags**
<span class="notstartedstatus">NOT STARTED</span>


### Efficiency

<div class="padbottom"></div>
<span class="etabox">Q1 2020</span>**Faster incremental tests on `--test_*`
changes**
<span class="inprogressstatus">IN PROGRESS</span> ([#6842](https://github.com/bazelbuild/bazel/issues/6842))

* Specifically, changing `--test_*` doesn't redo the analysis phase

<div class="padbottom"></div>
<span class="etabox">Q1 2020</span>**A diganostic tool explains performance
impact of configuration APIs**
<span class="inprogressstatus">IN PROGRESS</span> ([#10613](https://github.com/bazelbuild/bazel/issues/10613))

* For example, how does a
  [transition](https://docs.bazel.build/versions/master/skylark/config.html#user-defined-transitions)
  affect the configured target graph, which targets are responsible,
  and how could trimming help?
* Also quantifies action caching inefficiency

<div class="padbottom"></div>
<span class="etabox">mid 2020</span>**An experimental Bazel mode automatically
"trims" build graphs**
<span class="notstartedstatus">NOT STARTED</span> ([#6524](https://github.com/bazelbuild/bazel/issues/6524))

* e.g. C++ rules don't re-analyze because of Java flag changes
* Building a binary's *Mac* and *Linux* versions simultaneously doesn't double the build graph

<div class="padbottom"></div>
<span class="etabox">Jul 2020</span>**An experimental Bazel mode caches
cross-platform Java compilation**
<span class="inprogressstatus">IN PROGRESS</span> ([#6526](https://github.com/bazelbuild/bazel/issues/6526))

* Improves multiplatform build speed
* Proof of concepts a [more general
  design](https://docs.google.com/document/d/17snvmic26-QdGuwVw55Gl0oOufw9sCVuOAvHqGZJFr4/edit)
  that guarantees ideal caching for *all* actions


### Features

<div class="padbottom"></div>
<span class="etabox">Mar 2020</span>**Projects can declare and compliance-check software
licenses** ([#7444](https://github.com/bazelbuild/bazel/issues/7444))
<span class="inprogressstatus">in progress</span>

  
### Documentation

<div class="padbottom"></div>
<span class="etabox">Jun 2020</span>**Guide to designing efficient multiplatform builds**
<span class="notstartedstatus">NOT STARTED</span>

