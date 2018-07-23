---
layout: contribute
title: Skylark roadmap
---

# Skylark Roadmap

*Last verified: 2018-07-18*
([update history](https://github.com/bazelbuild/bazel-website/commits/master/roadmaps/skylark.md))

*Point of contact:* [laurentlb](https://github.com/laurentlb)

## Goal

Our goal is to make Bazel more extensible. Users should be able to easily
implement their own rules, and support new languages and tools. We want to
improve the experience of writing and maintaining those rules.

We focus on two areas:

* Make the language and API simple, yet powerful.
* Provide better tooling for reading, writing, updating, debugging, and testing the code.

## Roadmap for Q3 2018

#### Tools

* Implement bzlint, a tool for linting and fixing code automatically ([#341](https://github.com/bazelbuild/buildtools/issues/341)).
* Implement [bzl-rename](https://docs.google.com/document/d/1quFadX5neC6dWC6uAG1WNQl9Yj1K7lR-LZD1JCrvj9A/edit),
  a tool for renaming symbols in BUILD and bzl files ([#342](https://github.com/bazelbuild/buildtools/issues/342)).
* Publish a prototype debugger for debugging rules.
* Publish a technical plan for improvements in testing facilities ([#5635](https://github.com/bazelbuild/bazel/issues/5635)).
* Write a new prototype of [Skydoc](https://skydoc.bazel.build/), able to handle
  rule definitions ([#102](https://github.com/bazelbuild/skydoc/issues/102)).


#### Rules and Language

* Forbid macros loaded transitively ([#5636](https://github.com/bazelbuild/bazel/issues/5636)).
* Implement the [Name resolution](https://github.com/bazelbuild/proposals/blob/master/docs/2018-06-18-name-resolution.md)
  ([#5637](https://github.com/bazelbuild/bazel/issues/5637)) proposal.
* Implement fast symbol lookup in the interpreter ([#5638](https://github.com/bazelbuild/bazel/issues/5638)).
* Improve/clean up build API (to be specified)
* Curate a [well tested set of Bazel rules](https://docs.google.com/document/d/1oYQ-cqmqrpVE02rphobn4F_Q-lqvch4IiUlqEy9q2Fs/edit)
