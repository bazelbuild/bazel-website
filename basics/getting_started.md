---
layout: contribute
title: Getting Started
---

# Setting up your coding environment

For now we have support for IntelliJ. We don't have IDE support for other
languages in Bazel right now.

## Preparations

*  [Install Bazel](https://bazel.build/versions/master/docs/install.html) on your
   system. Note that for developing Bazel, you need the latest released version
   of Bazel.
*  Clone Bazel's Git repository from GitHub:
   *  `git clone https://github.com/bazelbuild/bazel.git`
*  Try to build Bazel (you might need to [install some
   prerequisites](https://docs.bazel.build/versions/master/install-compile-source.html#bootstrap-unix)
   first):

   *  On Linux/macOS, in Bash/Terminal:

      ```
      cd bazel
      bazel build //src:bazel
      ```

   *  On Windows, in the Command Prompt:

      ```
      cd bazel
      bazel --output_user_root=c:\tmp build //src:bazel.exe
      ```

      For faster iteration times (but larger binaries), use `//src:bazel-dev.exe` instead.

*  This will produce a working Bazel binary in `bazel-bin/src/bazel` (or `bazel-bin/src/bazel.exe` on Windows).

## Creating an IntelliJ project

To work with IntelliJ:

*  Install Bazel's [IntelliJ plug-in](https://ij.bazel.build).
*  Set the path to the Bazel binary in the plugin preferences
   (`Preferences` > `Other Settings` > `Bazel Settings`).
*  Import the Bazel workspace as a Bazel project
   (`File` > `Import Bazel Project...`) with the following settings:
   *  Use existing Bazel workspace: choose your cloned Git repository.
   *  Select `Import from workspace` and choose the `scripts/ij.bazelproject`
   file as the `Project view`.
*  Download [Google's Java Code Style Scheme file for IntelliJ](https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml),
   import it (go to `Preferences` > `Editor` > `Code Style` > `Java`, click `Manage`, then `Import`)
   and use it when working on Bazel's code.

<a name="compile-bazel"></a>
## Compiling Bazel

To test out Bazel, you need to compile it. To compile a development version of
Bazel, you need a the latest released version of Bazel, which can be
[compiled from source](/versions/master/docs/install-compile-source.html).

`bazel build //src:bazel` builds the Bazel binary using `bazel` from your PATH
and the resulting binary can be found at `bazel-bin/src/bazel`. This is the
recommended way of rebuilding Bazel once you have bootstrapped it.

In addition to the Bazel binary, you might want to build the various tools Bazel
uses. They are located in `//src/java_tools/...`, `//src/objc_tools/...` and
`//src/tools/...` and their directories contain README files describing their
respective utility.

When modifying Bazel, you want to make sure that the following still works:

*  Build a distribution archive with `bazel build //:bazel-distfile`. After
   unzipping it in a new empty directory, run `bash compile.sh all` there.
   It rebuilds Bazel with `./compile.sh`, Bazel with the
   `compile.sh` Bazel and Bazel with the Bazel-built binary. It compares if the
   constructed Bazel builts are identical and then runs all Bazel tests with
   `bazel test //src/... //third_party/ijar/...`. This is what we use at Google
   to ensure that we don't break Bazel when pushing new commits, too.

## Debugging Bazel

Start creating a debug configuration for both C++ and Java in your `.bazelrc`
with the following:

```
build:debug -c dbg
build:debug --javacopt="-g"
build:debug --copt="-g"
build:debug --strip="never"
```

Then you can rebuild Bazel with `bazel build --config debug //src:bazel` and use
your favorite debugger to start debugging.

For debugging the C++ client you can just run it from gdb or lldb as you normally would.
But if you want to debug the Java code, you must attach to the server using the following:

*  Run Bazel with debugging option `--host_jvm_debug` before the
   command (e.g., `bazel --host_jvm_debug build //src:bazel`).
*  Attach a debugger to the port 5005. With `jdb` for instance,
   run `jdb -attach localhost:5005`.
*  Our IntelliJ plugin has built-in
  [debugging support](https://ij.bazel.build/docs/run-configurations.html)

# Bazel's code description

Please read [CODEBASE.md](https://github.com/bazelbuild/bazel/blob/master/CODEBASE.md)
for a detailed description of the code base.

Bazel is organized in several parts:

*  Client code in `src/main/cpp` provides the command-line interface.
*  Protocol buffers in `src/main/protobuf`.
*  Server code in `src/main/java` and `src/test/java`.
   *  Core code which is mostly composed of [SkyFrame](/designs/skyframe.html) and some
     utilities.
   *  Builtin rules in `com.google.devtools.build.lib.rules` and in
     `com.google.devtools.build.lib.bazel.rules`. You might want to read about
     the [Challenges of Writing Rules](docs/rule-challenges.html) first.
*  Java native interfaces in `src/main/native`.
*  Various tooling for language support (see the list in the
   [compiling Bazel](#compile-bazel) section).

# Searching Bazel's source code

To quickly search through Bazel's source code, use [Bazel Code Search](https://source.bazel.build/). You can navigate Bazel's repositories, branches, and files. You can also view history, diffs, and blame information. To learn more, see the
[Bazel Code Search User Guide](https://www.bazel.build/browse-and-search-user-guide.html).

# Using Bazel Continuous Integration

To get started with the Bazel CI system, see [Bazel Continuous Integration](https://github.com/bazelbuild/continuous-integration/blob/master/buildkite/README.md). To monitor the tests and builds of your Bazel contributions, use the [Bazel CI Dashboard](https://ci.bazel.build/).
