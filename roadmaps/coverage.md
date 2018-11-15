---
layout: contribute
title: Bazel Code Coverage Roadmap
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

# Bazel Code Coverage Roadmap 2018

*Last verified: 2018-08-08* ([update history](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/coverage.md))

## Fast Bazel C++ coverage ([tracking issue](https://github.com/bazelbuild/bazel/issues/5882)) (P0)

Currently C++ coverage is 2x slower than just running the corresponding tests.
The goal is to have similar times for running bazel test and bazel coverage on
the same targets.

Objectives:

* C++ coverage with clang uses profdata and outputs lcov ([tracking issue](https://github.com/bazelbuild/bazel/issues/5881))
 <span class="inprogressstatus">IN PROGRESS</span>
* C++ coverage with gcc uses gcov and outputs lcov ([tracking issue](https://github.com/bazelbuild/bazel/issues/5880))
   <span class="donestatus">DONE</span>

## Have a reliable Bazel coverage report (P1)

Objectives:

* [C++] Fix symlinks following in the coverage report.
  <span class="inprogressstatus">IN PROGRESS</span>
* [sh] Improve sh\_test coverage ([tracking issue](https://github.com/bazelbuild/bazel/issues/5331))
  <span class="donestatus">DONE</span>
* [Java] Improve Java coverage ([tracking issue](https://github.com/bazelbuild/bazel/issues/5426))
  <span class="inprogressstatus">IN PROGRESS</span>

## Improve adding coverage support for Skylark rules (P2)

Objectives:

* Have a design for coverage\_toolchain. (see [Bazel coverage design
  doc](https://docs.google.com/document/d/1-ZWHF-Q-qCKf19ik-t33ie58BkNurrYYzKR4OLtcilY/edit?usp=sharing))
  <span class="notstartedstatus">NOT STARTED</span>

## Github hotlist
At any time you can check out the [updated hotlist of all prioritized coverage issues](https://github.com/bazelbuild/bazel/issues?q=is%3Aopen+is%3Aissue+label%3Acoverage).
