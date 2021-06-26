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

*Last verified: 2018-12-21* ([update history](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/cpp.md))

## C++ Sandwich (2019/Q1)

Status: <span class="inprogressstatus">IN PROGRESS</span>

Objective: It's possible to write a custom Starlark rule that can depend on C++
rules, and C++ rules can depend on Starlark (C++ sandwich)
([tracking issue](https://github.com/bazelbuild/bazel/issues/4570),
owner: [oquenchil](https://github.com/oquenchil)).

2018/Q4 status: C++ providers are stable and exposed without experimental flag in Bazel 0.22. `cc_common.compile` and `cc_common.link` are guarded behind experimental flag and expected to reach stable in Bazel 0.23.

## Migrate Crosstools to Features (2019/Q1)

Status: <span class="inprogressstatus">IN PROGRESS</span>

Objective: Features are the only way of defining crosstool flags
(owner: [hlopko](https://github.com/hlopko),
[tracking issue](https://github.com/bazelbuild/bazel/issues/5883),
[rollout doc](https://docs.google.com/document/d/1uv4c1zag6KvdI31qdx8C6jiTognXPQrxgsUpVefm9fM/edit#heading=h.5mcn15i0e1ch),
[incompatible flag](https://github.com/bazelbuild/bazel/issues/6861)).

## Crosstool in Starlark (2019/Q1)

Status: <span class="inprogressstatus">IN PROGRESS</span>

Objective: Crosstool can be written in Starlark 
([design doc](https://docs.google.com/document/d/1Nqf16jqDGWSrPp4VuRxh0iNnVBoAXsO0meDH69J9xoc/edit#heading=h.r30au8wdo4dh),
[tracking issue](https://github.com/bazelbuild/bazel/issues/5380),
owner: [scentini](https://github.com/scentini)).

## C++ rules use platforms (2019/Q1)

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: C++ toolchain is selected using
[platforms](https://docs.bazel.build/versions/main/platforms.html).

## System-installed libraries (2019/Q1)

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: C++ rules are able to depend on a system library using cc_import (possibly build it from source if absent) in a way that works with remote cache/execution and multiple platforms.

## Removing hardcoded linux/gcc/libstdc++ assumptions (2019/Q2)

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: Bazel doesn't assume linux/gcc anywhere (including include directories).

## Simplifying Linking Modes (2019/Q2)

Status: <span class="inprogressstatus">IN PROGRESS</span>

Objective: Crosstool definition for linking modes is based on features; it is
possible to control linking of system libraries ([design
doc](https://docs.google.com/document/d/1w3nYuuzAeWSmv5UiPrxNE5sHJfsw1t2ywJp1v6HEndg/edit),
owner: [hlopko](https://github.com/hlopko)).

2018/Q4 status: Toolchain libraries are the last piece that is missing.

## Transitive Libraries (2019/Q2)

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: It's possible to build a static or a shared library with full control
over which dependencies are linked statically and which dynamically ([design
doc](https://docs.google.com/document/d/1d4SPgVX-OTCiEK_l24DNWiFlT14XS5ZxD7XhttFbvrI/edit?usp=sharing)).
