---
layout: contribute
title: Bazel Remote Execution Roadmap
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

# Bazel Remote Execution Roadmap

*Last verified: 2019-07-10*

*Point of contact:* [buchgr](https://github.com/buchgr),
[ishikhman](https://github.com/ishikhman)

## Goal

Our goal is to make Bazel work great with remote caching and execution systems. Users should be able to easily connect to a remote execution system and benefit from build/test performance and scalability improvements.


### Usability

Status: <span class="inprogressstatus">IN PROGRESS</span>

Objective: Configuring Bazel to connect to a remote caching and/or execution system has been streamlined in that it takes only a small number of easy to use flags. Configuration errors trigger understandable and actionable error messages ([issues](https://github.com/bazelbuild/bazel/projects/2)).


### Builds without the Bytes

Status: <span class="inprogressstatus">IN PROGRESS</span>

Objective: Bazel should only download build outputs that are requested by a user in order to use less network bandwidth and thereby reduce build and test times ([blog post](https://blog.bazel.build/2019/05/07/builds-without-bytes.html), [tracking issue](https://github.com/bazelbuild/bazel/issues/6862), [design doc](https://docs.google.com/document/d/11m5AkWjigMgo9wplqB8zTdDcHoMLEFOSH0MdBNCBYOE/edit#heading=h.fceq4hflt47f)).


#### Use Case: Continuous Integration

Status: <span class="donestatus">DONE</span>

Objective: All critical features required for enabling this mode in a continuous integration environment are available to use in a Bazel release. In particular, Bazel supports not downloading any build outputs, only top level outputs as well as translating local file paths for [BES](https://docs.bazel.build/versions/master/build-event-protocol.html).


#### Use Case: Developer Builds

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: "Builds without the Bytes" properly supports incremental builds with a cold Bazel server and works seamlessly with [Bazel's IntelliJ plugin](https://ij.bazel.build/).


#### Default to downloading top level outputs

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: "Builds without the Bytes" has been battle tested by Bazel users for both continuous integration as well as developer builds and only downloading top level outputs is the default mode.


### Platforms for Remote Execution

Status: <span class="inprogressstatus">IN PROGRESS</span>

Objective: Remote caching and execution users are able to use platforms effectively to configure their builds in a way that allows them to be executed remotely and safely share cache hits between machines.


### Metrics and Profiler Integration

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: Bazel provides information about network usage/conditions and metrics of a remote build via Bazel's profiler, the BEP and/or the command line interface. A user can understand Bazel's network usage and how it affects build performance ([issue](https://github.com/bazelbuild/bazel/issues/6727)).


### Async Action Execution

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: Remotely executed or cached actions should not count towards Bazel's parallelism limit (--jobs) allowing Bazel to always utilize the full parallelism provided by a build graph and remote backend ([issue](https://github.com/bazelbuild/bazel/issues/6394)).


### Remote Caching

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: Remote caching should be a simple and effective ("cheap") way to improve build and test performance. It should be dead simple for users to connect to a remote caching backend without requiring extensive modifications of their build.


#### Support HTTP/2.0 as a caching protocol

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: Bazel transparently uses the HTTP/2.0 protocol for remote caching if the backend supports it and significantly reduces the number of required TCP connections.


#### Parallel Uploads

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: Bazel uploads outputs of a single action in parallel to the remote caching backend. This greatly improves the performance of builds with little parallelism.


#### Support unreliable networks

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: Bazel can detect unreliable network conditions that slows down the build and transparently fallback to building locally without the remote cache. It can continuously probe the network and turn remote caching back on if conditions improve.


### Developer Builds

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: Remote execution is reliable and fast for incremental developer builds. In particular Bazel does not leak bits of the host environment into remote actions and supports executing actions in a single round trip in the common case. The [dynamic spawn strategy](https://blog.bazel.build/2019/02/01/dynamic-spawn-scheduler.html) is supported.


### Local Caching and Authentication Proxy

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: Bazel can transparently start a local proxy process that can act as a first level cache (like --disk_cache) as well as add authentication headers to network requests. This will enable us to support a variety of authentication methods without maintaining and shipping these dependencies with the Bazel binary.


### Virtual External Repositories

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: Bazel provides an API that supports fetching a manifest instead of the full contents of a static external repository (e.g. http_archive). This is one step towards removing the host machine to be a bottleneck and towards [fully virtualizing](https://docs.google.com/document/d/17WJ4cz150IHeTgvJGxcbSGK1Zg2vsLpcgUSVffrwGfk/edit#) inputs and outputs.


### Remote Execution of [repository_rule](https://docs.bazel.build/versions/master/skylark/repository_rules.html)

Status: <span class="notstartedstatus">NOT STARTED</span>

Objective: Bazel can remotely execute a repository_rule. This will allow repository rules to be cached remotely and is a step towards removing the host machine as a bottleneck. It enables important use cases like autogenerating toolchains for the remote environment.
