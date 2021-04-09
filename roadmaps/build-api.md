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
  .droppedstatus {
    color: #0D0000;
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

*Last verified: 2021-04-09*
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
    rules. <span class="donestatus">DONE</span>

<div class="padbottom"></div>
<span class="etabox">Q2 2021</span>

*   Improve Starlark support for **native libraries** in Java.
    <span class="inprogressstatus">IN PROGRESS</span>
*   Improve <code>java_common</code> support for plugins and IDEs - proposal
    [Java common refactoring](https://docs.google.com/document/d/10isTEK5W9iCPp4BIyGBrLY5iti3Waaam6EeGVSjq3r8/edit).
    <span class="inprogressstatus">IN PROGRESS</span>
*   **java_library** rule is Starlarkified. <span class="inprogressstatus">IN
    PROGRESS</span>

<div class="padbottom"></div>
<span class="etabox">Mid 2021</span>

*   **java_binary and java_test** rules are Starlarkified.
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

*   **Clang modules** support, <span class="droppedstatus">DROPPED*</span>
*   and **Include scanning** support, expected performance improvements from
    both <span class="droppedstatus">DROPPED*</span>
*   *We need more data to evaluate whether modules are really what is needed to
    improve performance.

<div class="padbottom"></div>
<span class="etabox">Q2 2021</span>

*   Internal **Go rules** are Starlarkified <span class="inprogressstatus">IN
    PROGRESS</span>
*   Objective-C rules **objc_library and objc_import** and native code related
    to them are Starlarkified <span class="inprogressstatus">IN PROGRESS</span>

<div class="padbottom"></div>
<span class="etabox">Fall 2021 and beginning 2022</span>

*   **cc_binary, cc_test and cc_library** are Starlarkified

<div class="padbottom"></div>
<span class="etabox">2022</span>

*   Starlarkification of other C++ rules (**fdo_profile, cc_import,
    cc_toolchain, cc_toolchain_suite, fdo_prefetch_hints, cc_toolchain_alias,
    cc_libc_top_alias, cc_host_toolchain_alias,** +2)
*   Starlarkification of **cc_common module**

## Misc

<div class="padbottom"></div>
<span class="etabox">Mid 2021</span>

*   Aspect can propagate other aspects - proposal
    [Aspects Propagating Other Aspects](https://docs.google.com/document/d/1fVNyskIgMoiNeOOGt57LdDmEkAShkYUKYQTkf5yD1fA/edit).
    <span class="inprogressstatus">IN PROGRESS</span>
*   Improve Starlark testing framework
