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

*Last verified: 2021-01-25* ([update history](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/configuration.md))

*Point of contact:* [gregestren](https://github.com/gregestren)

*Discuss:*  [Configurability roadmap: discussion](https://github.com/bazelbuild/bazel/issues/6431)

**This roadmap has been retired. See [here](../configuration.html) for the current roadmap.**

## Previous Roadmaps

* [2019](2019/configuration.html) (w/ EOY review)
* [2018](2018/configuration.html)

## EOY Review
*Status as of Jan 2021:*

7 initiatives <span class="donestatus">DONE</span>. 12 <span
class="inprogressstatus">IN PROGRESS</span>. 6 <span class="notstartedstatus">NOT STARTED</span>.

Platforms:

* [Incompatible target
skipping](https://docs.bazel.build/versions/master/platforms.html#skipping-incompatible-targets)
*delivered* in Bazel 4.0. Big thanks to [@philsc](https://github.com/philsc) for
carrying the feature through.
* Java rules
  [migrated](https://docs.bazel.build/versions/master/platforms-intro.html#java)
  to platforms. Big thanks to [@comius](https://github.com/comius) for
  implementation.
* Core devs are doubling down on migrating Android rules. This will also [unlock](https://docs.bazel.build/versions/master/platforms-intro.html#c) C++
  rules. We're continuing this focus in the interest of making Bazel's platform
  API the standard for all projects. This is involved work that will continue
  through 2021.
* Multiple execution platforms was deprioritized for Android work. But it has
  new commitment in 2021 (it now has dedicated ownership).

Other work:

* [Flag
  aliases](https://docs.bazel.build/versions/master/skylark/config.html#using-build-setting-aliases)
  *delivered* in Bazel 4.0:
  [write](https://docs.bazel.build/versions/master/skylark/config.html#user-defined-build-settings)
  `//my/package:my_flag` in Starlark and set it as `--myflag` at the command
  line. Big thanks for [@warkahscott](https://github.com/warkahscott) for
  delivering the feature and [@juliexxia](https://github.com/juliexxia) for
  guiding it.
* [--trim_test_configuration](https://github.com/bazelbuild/bazel/issues/6842)
  is expected to land in Bazel 4.1. This makes it possible to test with
  different flags without slow rebuilds. Big thanks to
  [@sdtwigg](http://github.com/sdtwigg) for implementation.
* Other efficiency efforts, like cacheable output paths, continue slowy because
  of insufficient dev allocation. They'll continue to move forward, but
  collaborators welcome!

For 2021, we're going to put more effort behind fewer initiatives at a
time. We'll note "later in the year" efforts but not give them estimates until
they're actively prioritized. 

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
<span class="etabox">Q1 2020</span>**Toolchains can build both buildtime and runtime artifacts**
<span class="donestatus">DONE</span> ([#10523](https://github.com/bazelbuild/bazel/issues/10523))

* For example, compiler tools (which run on the build machine) and generated source code (which runs on the target machine)

<div class="padbottom"></div>
<span class="etabox">Q2 2020</span>**Builds support [multiple execution
platforms](https://docs.google.com/document/d/1U9HzdDmtRnm244CaRM6JV-q2408mbNODAMewcGjnnbM/)**
<span class="inprogressstatus">IN PROGRESS</span> ([#11748](https://github.com/bazelbuild/bazel/issues/11748))

<div class="padbottom"></div>
<span class="etabox">Fall 2020</span>**C++ rules use the new [platforms
API](https://docs.bazel.build/versions/master/platforms-intro.html)** 
<span class="inprogressstatus">IN PROGRESS</span> ([#6516](https://github.com/bazelbuild/bazel/issues/6516))

* Already [ready](https://github.com/bazelbuild/bazel/issues/7260) but need
  [platform
  mappings](https://docs.bazel.build/versions/master/platforms-intro.html#how-to-use-platforms-today)
  to [support](507230303) Android/IOS projects
* *Final update*: we're fulfilling this by implementing proper Android / iOS
  support in 2021

<div class="padbottom"></div>
<span class="etabox">Fall 2020</span>**Java rules use the new [platforms
API](https://docs.bazel.build/versions/master/platforms-intro.html)**
<span class="donestatus">DONE</span> ([#4592](https://github.com/bazelbuild/bazel/issues/4592))

* Same as C++ but also need [platform definitions](https://github.com/bazelbuild/rules_java/pull/8)

<div class="padbottom"></div>
<span class="etabox">Fall 2020</span>**Android rules use the new [platforms
API](https://docs.bazel.build/versions/master/platforms-intro.html)**
<span class="inprogressstatus">IN PROGRESS</span> ([#11749](https://github.com/bazelbuild/bazel/issues/11749))

* *Final update*: primary focus in 2021

<div class="padbottom"></div>
<span class="etabox">mid 2020</span>**`bazel build //:all` [automatically skips](https://docs.google.com/document/d/12n5QNHmFSkuh5yAbdEex64ot4hRgR-moL1zRimU7wHQ/edit?ts=5dfbe2fe)
platform-incompatible targets**
<span class="donestatus">DONE</span> ([#10945](https://github.com/bazelbuild/bazel/issues/10945))

<div class="padbottom"></div>
<span class="etabox">2021</span>**Deprecate and remove `--cpu` and related flags**
<span class="notstartedstatus">NOT STARTED</span>


### Efficiency

<div class="padbottom"></div>
<span class="etabox">Q3 2020</span>**Faster incremental tests on `--test_*`
changes**
<span class="donestatus">DONE</span> ([#6842](https://github.com/bazelbuild/bazel/issues/6842))

* **Final update*: expected to land in Bazel 4.1.

* Specifically, changing `--test_*` doesn't redo the analysis phase

<div class="padbottom"></div>
<span class="etabox">August 2020</span>**A diganostic tool explains performance
impact of configuration APIs**
<span class="donestatus">DONE</span> ([#10613](https://github.com/bazelbuild/bazel/issues/10613))

* For example, how does a
  [transition](https://docs.bazel.build/versions/master/skylark/config.html#user-defined-transitions)
  affect the configured target graph, which targets are responsible,
  and how could trimming help?
* Also quantifies action caching inefficiency

<div class="padbottom"></div>
<span class="etabox">Unclear ETA</span>**An experimental Bazel mode automatically
"trims" build graphs**
<span class="notstartedstatus">NOT STARTED</span> ([#6524](https://github.com/bazelbuild/bazel/issues/6524))

* e.g. C++ rules don't re-analyze because of Java flag changes
* Building a binary's *Mac* and *Linux* versions simultaneously doesn't double the build graph

<div class="padbottom"></div>
<span class="etabox">October 2020</span>**An experimental Bazel mode caches
cross-platform Java compilation**
<span class="inprogressstatus">IN PROGRESS</span> ([#6526](https://github.com/bazelbuild/bazel/issues/6526))

* Improves multiplatform build speed
* Proof-of-concepts a [more general
  design](https://docs.google.com/document/d/17snvmic26-QdGuwVw55Gl0oOufw9sCVuOAvHqGZJFr4/edit)
  that guarantees ideal caching for *all* actions
* *Final update*: continuing to get part-time effort.  Help appreciated.


### Features

<div class="padbottom"></div>
<span class="etabox">September 2020</span>**Short and sharp [Starlark flags](https://docs.bazel.build/versions/master/skylark/config.html#user-defined-build-settings)** 
<span class="donestatus">DONE</span> ([#11750](https://github.com/bazelbuild/bazel/issues/11750))

<div class="padbottom"></div>
<span class="etabox">late 2020</span>**Projects can declare and compliance-check software licenses** 
<span class="inprogressstatus">in progress</span> ([#7444](https://github.com/bazelbuild/bazel/issues/7444))

  
### Documentation

<div class="padbottom"></div>
<span class="etabox">late 2020</span>**Guide to designing efficient multiplatform builds**
<span class="notstartedstatus">NOT STARTED</span>

* What are performance bottleneck concerns?
* What options are there for relieving them?
* What tools are available for measuring?
* **Final update*: deprioritized for lack of user interest.
