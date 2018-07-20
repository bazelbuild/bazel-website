---
layout: contribute
title: Bazel on Windows Roadmap
---

# Bazel on Windows Roadmap

*Last verified: 2018-07-19*
([update history](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/windows.md))

**Point of contact:** [laszlocsomor](https://github.com/laszlocsomor)

## Goal

Our goal is to make Bazel fast, reliable, and easily usable on Windows.

## Roadmap for Q3 2018

#### Break Bash dependency

*   Running tests should not require Bash and Perl
    ([#5508](https://github.com/bazelbuild/bazel/issues/5508),
    [#4691](https://github.com/bazelbuild/bazel/issues/4691)).

#### Increase test coverage

*   Document runfiles libraries in Build Enclycopedia at `*_binary.data`.
*   Roll out Bash runfiles support to `//src/test/shell/...`
    ([#4292](https://github.com/bazelbuild/bazel/issues/4292)).
*   Run 90% of `//src/...` on Windows.

#### Support TensorFlow

*   Build TFLite on Windows
    ([#4148](https://github.com/bazelbuild/bazel/issues/4148)).

## Future work (unscheduled)

#### Break Bash dependency ([#4319](https://github.com/bazelbuild/bazel/issues/4319))

*   Make shell-using rules use the shell toolchain.
*   Implement a tool to merge files and text, to break dependency on bintools
    when creating `py_binary` stub.
*   Create example project on GitHub showing how to write a custom shell
    toolchain for local and remote builds, and how to override the default
    toolchain. Link to this project from the Build Encyclopdia or the User
    Manual, and announce it on the Blog.
*   Break
    [`RunCommand`](https://github.com/bazelbuild/bazel/blob/cc0f41dccc55bb1380b10cc65281632676192a8d/src/main/java/com/google/devtools/build/lib/runtime/commands/RunCommand.java#L455)'s
    dependency on Bash. [It cannot select a toolchain without a
    `RuleContext`.](https://groups.google.com/d/msg/bazel-discuss/pYJoWFfkyAE/iwpzfXlVCQAJ)
*   Design a way to express dependency on bintools (e.g. "perl", "grep")
    ([#5265](https://github.com/bazelbuild/bazel/issues/5265)).

#### Improve runfiles experience for Java, C++, Python, and Bash programs

*   Implement `rfind()` for all runfiles libraries
    ([#4334](https://github.com/bazelbuild/bazel/issues/4334)).

#### Improve test coverage

*   Fix `$(location)` expansion in `*_test.args`
    ([#4171](https://github.com/bazelbuild/bazel/issues/4171)).
*   Speed up bootstrap test
    ([#4503](https://github.com/bazelbuild/bazel/issues/4503)).

#### Fix Bazel client bugs

*   Fix corrupt install
    ([#5091](https://github.com/bazelbuild/bazel/issues/5091),
    [#4378](https://github.com/bazelbuild/bazel/issues/4378)).
*   Improve code health: remove all MSYS path conversion logic
    ([#2507](https://github.com/bazelbuild/bazel/issues/2507)).
*   Support Cyrillic characters
    ([#3821](https://github.com/bazelbuild/bazel/issues/3821),
    [#2443](https://github.com/bazelbuild/bazel/issues/2443)).

#### Fix `*_binary` launcher

*   Remove `../` in classpath jars
    ([#4420](https://github.com/bazelbuild/bazel/issues/4420)).

#### Implement sandboxing

*   Research sandboxing feasibility
    ([#5136](https://github.com/bazelbuild/bazel/issues/5136)).

#### Improve Android support

*   Build the Android Hello World project on Windows on BuildKite
    ([#3663](https://github.com/bazelbuild/bazel/issues/3663)).
*   Run Android desugar tests on Windows
    ([#4797](https://github.com/bazelbuild/bazel/issues/4797)).
*   Run all Android tests on Windows.
*   Fix Android Python tools to use Bazel's JNI library from embedded tools
    ([#3832](https://github.com/bazelbuild/bazel/issues/3832)).
*   Fix Android Python tools to support long paths
    ([#3963](https://github.com/bazelbuild/bazel/issues/3963)).
*   Support Android Studio on Windows
    ([#3888](https://github.com/bazelbuild/bazel/issues/3888)).

#### Fix the following set of uncategorized issues

*   Write Skylark rule migration guide
    ([#3889](https://github.com/bazelbuild/bazel/issues/3889)).
*   Fix `glob.exclude_directories`
    ([#3674](https://github.com/bazelbuild/bazel/issues/3674)).
*   Break `cmd.exe` dependency
    ([#2190](https://github.com/bazelbuild/bazel/issues/2190)).
*   Quote empty arguments
    ([#4778](https://github.com/bazelbuild/bazel/issues/4778)).
*   Fix repository rule invalidation
    ([#3143](https://github.com/bazelbuild/bazel/issues/3143),
    [#3374](https://github.com/bazelbuild/bazel/issues/3374)).
*   Fix NPE in `maven_server`
    ([#1941](https://github.com/bazelbuild/bazel/issues/1941)).
*   Check `new_local_repository` arguments
    ([#3192](https://github.com/bazelbuild/bazel/issues/3192)).
*   Fix that `repository_ctx.execute` ignores `PATH`
    ([#3445](https://github.com/bazelbuild/bazel/issues/3445)).
*   Support `--watchfs`
    ([#1931](https://github.com/bazelbuild/bazel/issues/1931)).
