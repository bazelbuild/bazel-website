---
layout: contribute
title: Bazel on Windows Roadmap
---

# Bazel on Windows Roadmap

Everyone's welcome to suggest items and to contribute!

**Adding to this list**: please [open a GitHub
issue](https://github.com/bazelbuild/bazel/issues/new) to request features or
bugfixes.

**Contribution**: please follow our [contribution guide](/contributing.html).

**Feedback**: please send us an email to
<a href="mailto:bazel-discuss@googlegroups.com">bazel-discuss@googlegroups.com</a>.

**Update history**: see this [page's history on
GitHub](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/windows.md).

---

*   **Break Bash dependency**
    ([#4319](https://github.com/bazelbuild/bazel/issues/4319)).
    *   **[partially completed, on hold]** Make shell-using rules use the shell
        toolchain.
        *   **[status as beginning of Q3'18]**: Shell-using rules now report an
            error if the shell is missing (if Bazel is not aware of a shell
            interpreter). They don't yet use the shell toolchain, which they
            would only really need for remote builds. We can break the rash
            dependency for local builds without using the shell toolchain.
    *   **[on hold]** Implement a tool to merge files and text, to break
        dependency on bintools when creating `py_binary` stub.
        *   **[status as beginning of Q3'18]**: Was scheduled for Q2'18 but we
            couldn't deliver it. A more important blocker for breaking the Bash
            dependency ([#5508](https://github.com/bazelbuild/bazel/issues/5508)).
            came up.
    *   **[scheduled for Q3'18]** Bash-less test execution
        ([#5508](https://github.com/bazelbuild/bazel/issues/5508)).
    *   Create example project on GitHub showing how to write a custom shell
        toolchain for local and remote builds, and how to override the default
        toolchain. Link to this project from the Build Encyclopdia or the User
        Manual, and announce it on the Blog.
    *   **[scheduled for Q3'18]** Break test-setup's dependency on Perl and on
        Bash ([#4691](https://github.com/bazelbuild/bazel/issues/4691)).
    *   Break
        [`RunCommand`](https://github.com/bazelbuild/bazel/blob/cc0f41dccc55bb1380b10cc65281632676192a8d/src/main/java/com/google/devtools/build/lib/runtime/commands/RunCommand.java#L455)'s
        dependency on Bash. [It cannot select a toolchain without a
        `RuleContext`.](https://groups.google.com/d/msg/bazel-discuss/pYJoWFfkyAE/iwpzfXlVCQAJ)
    *   Design a way to express dependency on bintools (e.g. "perl", "grep")
        ([#5265](https://github.com/bazelbuild/bazel/issues/5265)).

*   **[done] Improve C++ build experience.**
    *   **[done]** Enable short object paths by default
        ([#4148](https://github.com/bazelbuild/bazel/issues/4148)).
    *   **[done]** Make file extensions configurable
        ([#1013](https://github.com/bazelbuild/bazel/issues/1013),
        [#1954](https://github.com/bazelbuild/bazel/issues/1954),
        [#3418](https://github.com/bazelbuild/bazel/issues/3418)).

*   **Improve runfiles experience for Java, C++, Python, and Bash programs.**
    *   **[done]** Implement and roll out all runfiles libraries as
        `@bazel_tools//tools/<language>/runfiles`
        ([#4460](https://github.com/bazelbuild/bazel/issues/4460)).
    *   **[scheduled: Q3'18]** Document runfiles libraries in Build Enclycopedia
        at `*_binary.data`
        *   **[status as beginning of Q3'18]**: Was scheduled for Q2'18 but we
            didn't deliver it. We'll try to deliver it in Q3'18.
        ([#4279](https://github.com/bazelbuild/bazel/issues/4279)).
    *   Implement `rfind()` for all runfiles libraries
        ([#4334](https://github.com/bazelbuild/bazel/issues/4334)).

*   **Improve test coverage.**
    *   **[done]** Roll out Bash runfiles support to
        `//examples/shell`
        ([#3839](https://github.com/bazelbuild/bazel/issues/3839)).
    *   **[scheduled: Q3'18]** Roll out Bash runfiles support to
        `//src/test/shell/...`
        *   **[status as beginning of Q3'18]**: In progress. Was scheduled for
            Q2'18 and we started the work, but we only scratched the surface.
            It'll need at least 3 more months if not more.
        ([#4292](https://github.com/bazelbuild/bazel/issues/4292)).
    *   **[scheduled: Q3'18]** Run 90% of `//src/...` on Windows
        ([#4292](https://github.com/bazelbuild/bazel/issues/4292)).
    *   Fix `$(location)` expansion in `*_test.args`
        ([#4171](https://github.com/bazelbuild/bazel/issues/4171)).
    *   Speed up bootstrap test
        ([#4503](https://github.com/bazelbuild/bazel/issues/4503)).

*   **Fix Bazel client bugs.**
    *   **[done]** Fix new year bug
        ([#4378](https://github.com/bazelbuild/bazel/issues/4378)).
    *   Fix corrupt install
        ([#5091](https://github.com/bazelbuild/bazel/issues/5091),
        [#4378](https://github.com/bazelbuild/bazel/issues/4378)),
    *   Improve code health: remove all MSYS path conversion logic
        ([#2507](https://github.com/bazelbuild/bazel/issues/2507)).
    *   Support Cyrillic characters
        ([#3821](https://github.com/bazelbuild/bazel/issues/3821),
        [#2443](https://github.com/bazelbuild/bazel/issues/2443)).

*   **Fix `*_binary` launcher.**
    *   **[done]** Use Unicode Windows API
        ([#4473](https://github.com/bazelbuild/bazel/issues/4473)).
    *   Remove `../` in classpath jars
        ([#4420](https://github.com/bazelbuild/bazel/issues/4420)).

*   **Keep supporting TensorFlow.**
    *   **[scheduled: Q3'18]** Build TFLite on Windows
        ([#4148](https://github.com/bazelbuild/bazel/issues/4148)).
    *   **[done]** Help TF migrate their Pip package release pipeline on Windows
        from CMake to Bazel.

*   **Implement sandboxing.**
    *   Research sandboxing feasibility
        ([#5136](https://github.com/bazelbuild/bazel/issues/5136)).

*   **Improve Android support.**
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

*   **Fix the following set of uncategorized issues.**
    *   **[on hold]** Write Skylark rule migration guide
        ([#3889](https://github.com/bazelbuild/bazel/issues/3889)).
        *   **[status as beginning of Q3'18]**: Was scheduled for Q2'18 but we
            couldn't deliver it. We need to put this on hold because the other
            scheduled work is more important.
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
