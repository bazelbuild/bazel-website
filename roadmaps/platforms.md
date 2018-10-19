---
layout: contribute
title: Bazel Platforms Roadmap
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

# Bazel Platforms Roadmap

*Last verified: 2018-10-19* ([update history]
(https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/platforms.md))

*Point of contact:* [katre](https://github.com/katre)

## Goal

The Bazel [Platforms](https://docs.bazel.build/versions/master/platforms.html) project is a large effort to add a native concept of a "platform", which is something that can execute code, either as part of a build or as the result of a build.

## Platforms

### Platform and Constraint Rules and Providers
Status: <span class="donestatus">DONE</span>

Bazel needs a way to describe platforms, as a collection of constraints and values. Using these, we can compose descriptions of platforms that are then consumed by other projects below. This is a necessary precondition for all work on this roadmap.

Current progress: basic rules and providers for platforms and constraints exist and are usable. Special-cases for auto-detecting host and target platforms are implemented.

### Execution Platform Filtering
Status: <span class="donestatus">DONE</span>

Users sometimes need to better control the execution platform for rules and targets: for example, some libraries may only be able to compile on a specific platform due to included assembly code, or genrules may only execute on a platform with specific command line features enabled. Users should be able to specify extra execution platform constraints on both the target level (for end users) or the rule level (for rule authors).

<!-- TODO(katre): link to documentation -->

### Stronger Constraints Language
Status: <span class="notstartedstatus">NOT STARTED</span>

Users have requested several features that require a stronger constraint language than the current, very basic, approach. One feature is the ability to use constraint values that extend other constraint values, although this then opens the need to express the requirement for a specific constraint values, or a constraint and all of its parent constraint values (see the GitHub issue). Also, users have requested the ability to perform boolean logic (and, or, negation) on constraints. This will require a Skylark API to create and compose these types of more details constraint specifications.

### Better Platform Configuration and Transitions
Status: <span class="notstartedstatus">NOT STARTED</span>

Currently, the process of re-configuring platforms as dependencies of the targets that require them leads to strange behaviors after a configuration transition. A better process would be to load platforms once, at startup, and process transitions as changes to the platform object in the configuration.

This will then unlock work on toolchain-specific transitions.

### Platforms and Testing
Status: <span class="notstartedstatus">NOT STARTED</span>

Most test rules can be considered to have two phases: one that builds the test binary, and a second that executes the test binary and records the results. The current implementation in Bazel will use the same execution platform for both phases, but that is not the best approach (consider a case where the test is for a mobile device, so needs to be built on a machine with an appropriate toolchain, but executed in a virtual machine).

## Toolchains

### Toolchain Resolution
Status: <span class="donestatus">DONE</span>

Resolution is the process of choosing the proper toolchain for a rule from the available toolchains. The inputs are: the list of available toolchains, the current build configuration, the execution and target platforms, and the type of toolchain required. The rule will then gain a dependency on both the selected toolchain, and on the toolchain resolution skyvalue, so that if any of the inputs to the process are changed (including the list of available toolchains), resolution will be re-run so that the correct toolchain will be used.

Ongoing work to configurable query will handle full dependency tracking for toolchain-enabled targets.

### Skylark Toolchains
Status: <span class="donestatus">DONE</span>

Rule authors are able to define new toolchain types, and new toolchain instances, in Skylark, and use toolchains from Skylark rules.

### Native Toolchains
Status: <span class="donestatus">DONE</span>

Rule authors should be able to define new toolchains types, and new toolchain instances, in native code. Native rules should be able to request and use toolchains. Also, Skylark/Native toolchain interoperation should allow Skylark rules to use native toolchains and vice versa. If a toolchain is defined in native code it may or may not be possible to write Skylark code to instantiate it, depending on the toolchain definition.

#### Convert Existing Native Rules to use Toolchains
Status: <span class="inprogressstatus">IN PROGRESS</span>

For each rule set migrated to use toolchains, there will be a necessary
migration of BUILD files to work properly.

Current status:
* CC Rules - Code complete, not enabled by default.
* Java Rules - Work scheduled to start 2019Q1.
* Other Rules - Not yet scheduled.

### Toolchain Modes Documentation
Status: <span class="notstartedstatus">NOT STARTED</span>

Rule authors need better control over toolchain modes, such as different sanitizers, debug and optimized builds, etc. Some rules may model these as separate toolchains, and other rules may model these modes as a single toolchain that just applies new options. We need to provide best practices documentation and guidance for enabling these features.

### Toolchain-specific Configuration Transitions
Status: <span class="notstartedstatus">NOT STARTED</span>

Authors of toolchain rules need more specific configuration transition options available. Specifically, from a toolchain target (ie, a `cc_toolchain`, `go_toolchain`, etc), dependencies may need to be configured in either the configuration where the toolchain will execute (for actual tools), or the configuration where the final target will be built (for libraries to be linked in to the final output). Depends on Better Platform Configuration and Transitions.

## Other Areas

### Select and Platforms
Status: <span class="donestatus">DONE</span>

It is possible to use the current set of platforms in a `config_setting` target, instead of using the `--cpu` or `--host_cpu` flags.
<!-- TODO(katre): link to documentation -->

### Constraints and Platforms
Status: <span class="notstartedstatus">NOT STARTED</span>

Platforms should interact with the constraint system in a useful way, possibly obsoleting the existing `environment_group` and `environment` rules.

### Replace `--cpu` and `--host_cpu` flags
Status: <span class="notstartedstatus">NOT STARTED</span>

After most Bazel rules are using toolchains, we should replace many flags such as `--cpu`, `--host_cpu`, `--javabase`, and `--crosstool_top` with pure platform implementations. Any users wishing to customize one of these flags would instead define an appropriate platform and toolchain and use that.

