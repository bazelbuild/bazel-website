---
layout: contribute
title: Bazel Build API Roadmap
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

# Bazel Build API 2021 Roadmap

*Last verified: 2021-02-12*
([update history](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/build-api.md))

*Point of contact:* [comius](https://github.com/comius)

*Discuss:*
[Build API roadmap: discussion](https://github.com/bazelbuild/bazel/issues/13008)

## Scope

Build API team is covering native rule implementations and the native API
exposed to Starlark.

## Goal

Have all rules implemented in Starlark and handed over to teams specialised in
the particular language. Remove language specific logic from Bazel’s core.

## Java rules

The Java rules will first be rewritten to Starlark and tested internally on a
large code-base. After that they will be released to Bazel.

<div class="padbottom"></div>
<span class="etabox">Q1 2021</span>

*   Improve the **Java sandwich**, making it possible to rewrite existing Java
    rules. <span class="inprogressstatus">IN PROGRESS</span>
*   Improve Starlark support for **native libraries** in Java.
    <span class="inprogressstatus">IN PROGRESS</span>

<div class="padbottom"></div>
<span class="etabox">Mid 2021</span>

*   **java_library, java_binary and java_test** rules are Starlarkified.
*   **java_import and java_plugin** rules are Starlarkified.

<div class="padbottom"></div>
<span class="etabox">Fall 2021</span>

*   Starlarkification of **java_\*_proto_library**
*   Remaining java rules are Starlarkified: **java_package_configuration,
    java_runtime, java_toolchain**.

<div class="padbottom"></div>
<span class="etabox">2022</span>

*   Starlarkification of **java_common module**.

## C++ rules

Before C++ rules can be rewritten in Starlark some internal cleanups are needed.
After that the C++ rules will be rewritten to Starlark piece by piece using
builtins functionality. The API for C++ rules will not be made accessible from
.bzl files until cc_module is rewritten in Starlark as well.

<div class="padbottom"></div>
<span class="etabox">Q1 2021</span>

*   **Clang modules** support, <span class="inprogressstatus">IN PROGRESS</span>
*   and **Include scanning** support, expected performance improvements from
    both

<div class="padbottom"></div>
<span class="etabox">Mid 2021</span>

*   Internal **Go rules** are Starlarkified <span class="inprogressstatus">IN
    PROGRESS</span>
*   Objective-C rules **objc_library, j2objc_library, and objc_import** are
    Starlarkified
*   Optionally (if needed): platformization of apple_binary and Android rules

<div class="padbottom"></div>
<span class="etabox">Fall 2021 and beginning 2022</span>

*   **cc_binary, cc_test and cc_library** are Starlarkified

<div class="padbottom"></div>
<span class="etabox">2022</span>

*   Starlarkification of other C++ rules (**fdo_profile, cc_import, cc_toolchain,
    cc_toolchain_suite, fdo_prefetch_hints, cc_toolchain_alias,
    cc_libc_top_alias, cc_host_toolchain_alias,** +2)
*   Starlarkification of **cc_common module**
