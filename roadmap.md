---
layout: contribute
title: Roadmap
---

# Bazel Roadmap

## Bazel Core Improvement Areas 

As of July 2018, critical areas that Bazel team addresses within Bazel core to
fulfill the [Bazel Vision](https://docs.bazel.build/versions/master/bazel-vision.html)
are as follows:

*   **Remote execution API** is under development, but we are not yet ready to
    provide the full guidance to rule authors on how to write rules to enable it
    for their language.
*   **External dependency management** story needs to be improved including both
    the **general dependency management** mechanism in Bazel and **interfacing with
    external package managers and build systems**. The latter is critical for
    _gradual adoption_ of Bazel.
*   [**Configurability**](roadmaps/configuration.html). Outside of a few
    hardcoded cases (fat apk for Android,host -> target transitions), the promise
    of single-command multi-platform builds is unfulfilled. 
*   **Skylark API and tooling**. We need to support the rule authors with 
    **clear, documented, stable API**, and **strong language and tooling**:
    documentation generators, refactoring tools, testing frameworks and so on.

## Roadmaps for specific Bazel areas
*  [Configuarbility](roadmaps/configuration.html)
*  [Windows](roadmaps/windows.html)


## Releases

We publish releases on [Github](https://github.com/bazelbuild/bazel/releases).


## Code location

For the alpha and beta releases, the Bazel team will maintain two code
repositories:

*   A Google-internal repository, containing both Bazel code and
    Google-specific extensions and features
*   An external [GitHub repository](https://github.com/bazelbuild/bazel),
    containing only the Bazel code.

We anticipate making the external repository *primary* in the future, that is,
code from Google and non-Google contributors will be committed and tested in the
external repository first, then imported into the internal repository. For
the alpha and beta releases, however, the internal repository will be primary.
Changes to Bazel code will be frequently pushed from the internal to
the external repository.
