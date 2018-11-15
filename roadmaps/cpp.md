---
layout: contribute
title: Bazel C++ Rules Roadmap
---
<style>
  .padbottom { padding-bottom: 10px; }
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

# Bazel C++ Rules Roadmap

*Last verified: 2018-08-08* ([update history](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/cpp.md))

## Skylark API for the C++ toolchain (2018/Q3)

Status: <span class="donestatus">DONE</span>

Objective: It's possible to obtain the exact command line as C++ actions would
use from Skylark ([tracking
issue](https://github.com/bazelbuild/bazel/issues/4571), [design
doc](https://docs.google.com/document/d/1g91BWJITcYw_X-VxsDC0VgUn5E9g0kRBGoBSpoO41gA/edit), owner:
[mhlopko](https://github.com/mhlopko)).

## Simplifying Linking Modes (2018/Q3)

Status: <span class="inprogressstatus">IN PROGRESS</span>

Objective: Crosstool definition for linking modes is based on features; it is
possible to control linking of system libraries ([design
doc](https://docs.google.com/document/d/1w3nYuuzAeWSmv5UiPrxNE5sHJfsw1t2ywJp1v6HEndg/edit),
owner: [mhlopko](https://github.com/mhlopko)).

## C++ Sandwich (2018/Q3)

Status: <span class="inprogressstatus">IN PROGRESS</span>

Objective: It's possible to write a custom skylark rule that can depend on C++
rules, and C++ rules can depend on skylark (C++ sandwich)
([tracking issue](https://github.com/bazelbuild/bazel/issues/4570),
owner: [oquenchil](https://github.com/oquenchil)).


## Migrate Crosstools to Features (2018/Q3)

Status: <span class="inprogressstatus">IN PROGRESS</span>

Objective: Features are the only way of defining crosstool flags
(owner: [mhlopko](https://github.com/mhlopko)).

## Crosstool in Skylark (2018/Q3)

Status: <span class="inprogressstatus">IN PROGRESS</span>

Objective: Crosstool can be written in Skylark 
([design doc](https://docs.google.com/document/d/1Nqf16jqDGWSrPp4VuRxh0iNnVBoAXsO0meDH69J9xoc/edit#heading=h.r30au8wdo4dh),
[tracking issue](https://github.com/bazelbuild/bazel/issues/5380),
owner: [scentini](https://github.com/scentini)).

## C++ rules use platforms (2018/Q4)

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: C++ toolchain is selected using
[platforms](https://docs.bazel.build/versions/master/platforms.html).

## Removing hardcoded linux/gcc/libstdc++ assumptions (2018/Q4)

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: Bazel doesn't assume linux/gcc anywhere (including include directories).

## Transitive Libraries (2019/Q1)

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: It's possible to build a static or a shared library with full control
over which dependencies are linked statically and which dynamically ([design
doc](https://docs.google.com/document/d/1d4SPgVX-OTCiEK_l24DNWiFlT14XS5ZxD7XhttFbvrI/edit?usp=sharing)).

## System-installed libraries (2019/Q1)

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: C++ rules are able to depend on a system library using cc_import (possibly build it from source if absent) in a way that works with remote cache/execution and multiple platforms.
