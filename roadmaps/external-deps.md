---
layout: contribute
title: Bazel External Deps Roadmap
---

# Bazel External Deps Roadmap

*Last verified: 2018-07-17*
([Update history](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/external-deps.md))_

*Point of contact:* [dslomov](https://github.com/dslomov)

Roadmap for improving external dependencies support and integration with
package managers and other build systems in Bazel.

## Goal

External dependencies work fall into three broad categories:

1.  General improvements for WORKSPACE support in Bazel (see
   [External Repositories: The Future](https://docs.google.com/document/d/13OlvrQcPG15cnrY5InEwJ4J3rV_ykHTuHqEZVTqY2lk/)
   for general background and discussion).

1.  Allowing Bazel project to depend on other projects built with a different build tool and/or
   available through a package manager.
   *  [bazel-deps](https://github.com/johnynek/bazel-deps) is one tool that provide that support.
   *  [A good analysis](https://blog.envoyproxy.io/external-c-dependency-management-in-bazel-dd37477422f5)
      of challenges with C++ dependencies has been done by Envoy project.

1. Allowing other build systems to depend on Bazel project.
   *   Generally this includes features such as
       -   plugins for other build systems invoking Bazel
       -   publishing Bazel-built artifacts so that they can be used by other build systems
       -   generating project files  for other build systems
   *  The full set of features needed for this is currently forming. (We welcome your input on bazel-discuss@)


## 2018 Q2

1. General improvements for WORKSPACE support in Bazel
   *   Implement [diamond splitting](https://docs.google.com/document/d/1254CQ8T4Rmeasg4NO1NPail2kLPC50VJ7Ok6JsoSe-c/)
       for external dependencies. DONE
   *   Prototype support for [WORKSPACE.resolved](https://docs.google.com/document/d/1kVNXcw3nLlfFQRR_87SGOka9DJ8nnawlYHUIK4m3s0I/)
       -   [Blog post](https://blog.bazel.build/2018/07/09/bazel-sync-and-resolved-file.html)

1. Bazel depends on 3rd-party
   *   Exeperiments in [rules\_foreign\_cc](https://github.com/bazelbuild/rules_foreign_cc)

## 2018 Q3

1. General improvements for WORKSPACE support in Bazel
   *   Document curent state and best practices for BUILD files that can be used both as main and external
       repository, decide on whether the change to exec root layout is needed
   *   Implement WORKSPACE/WORKSPACE.resolved split, so that users can easily upgrade and share their
       dependencies in a controlled and well-defined way
   *   Technical plan for recursive workspaces: convenient way for users to manage transitive dependencies
1. Bazel depends on 3rd-party
   *   Provide rules for cmake and other C++ build systems
        -    Validation: Envoy is able to switch to these rules for their cmake dependecies.
   *   Integrate bazel-deps into WORKSPACE.resolved so that users don't have to run it as a separate tool
   *   Technical plan for PIP support

## 2018 Q4
   *   Technical plan for better support of WORKSPACE.configured (tentative)
   *   Technical plan for improvements of repository rule APIs and semantics (no restarts? action graphs?)
