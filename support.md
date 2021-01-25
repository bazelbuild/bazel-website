---
layout: contribute
title: Get Support
---

# Get Support

* Ask questions or discuss on the [User mailing list](https://groups.google.com/forum/#!forum/bazel-discuss).
* Report bugs or feature requests in our [GitHub issue tracker](https://github.com/bazelbuild/bazel/issues).
* Find other Bazel contributors on [Slack](https://slack.bazel.build).

# Support Policy

We generally avoid making backwards-incompatible changes. We have several years of experience with
supporting a huge code base that is concurrently worked on by thousands of engineers every day,
and have successfully made significant changes to the core as well as to the rules without missing
a beat. We run hundreds of thousands of tests at Google before every single release to ensure that
it stays that way.

That said, we occasionally have to make incompatible changes in order to fix bugs, to make further
improvements to the system, such as improving performance or usability, or to lock down APIs that
are known to be brittle.

This document gives an overview of features that are widely used and that we consider stable. By
stable, we mean that the changes we make will be backwards compatible, or that we will provide a
migration path.

It also covers features that are unstable. Either they are not yet widely used, or we are already
planning to change them significantly, possibly in ways that are not backwards compatible.

We cannot cover everything that might change, but you can reasonably expect that we provide
advance notice on the mailing list before a major change happens. We're also happy to provide more
details, just ask on [bazel-discuss](https://groups.google.com/forum/#!forum/bazel-discuss).

All undocumented features (attributes, rules, "Make" variables, and flags) are subject to change
at any time without prior notice. Features that are documented but marked *experimental* are also
subject to change at any time without prior notice.

Help keep us honest: report bugs and regressions in the
[GitHub bugtracker](https://github.com/bazelbuild/bazel/issues). We will make an effort to triage all
reported issues within 2 business days.

## Releases

We regularly publish [binary releases of Bazel](https://github.com/bazelbuild/bazel/releases).

### Policy

Every beginning of the month (we target the first business day of the month), we create a new release
candidate for a new MINOR version (e.g. 0.6.0). The work is tracked by a [release bug on GitHub](https://github.com/bazelbuild/bazel/issues?q=is%3Aissue+is%3Aopen+label%3Arelease) which indicates
the exact target date for the incoming month and assigned to the current Release Manager.
Those release candidates should pass all our unit tests, and show no unwanted regression in the
projects tested on [Buildkite](https://buildkite.com/bazel).

We announce those release candidates on [bazel-discuss](https://groups.google.com/forum/#!forum/bazel-discuss).
Over the next days, we monitor community bug reports for regressions in release candidate.

If no regressions are discovered, we officially release the candidate after one week. However,
regressions can delay the release of a release candidate. If regressions are found, we apply
corresponding cherry-picks to the release candidate to fix those regressions. If no further
regressions are found for two business days, but not before one week has elapsed since the first
release candidate, we release it.

After a release candidate is cut, we do not cherry-pick new features into it.
Moreover, if we discover that a new feature is buggy, we might decide to roll it back from a
release candidate. Only critical, high-impact bugs will be fixed in a release candidate.

A release can only be released on a day where the next day is a business day.

If a critical issue is found on the latest release, a patch release can be emitted by applying the
corresponding cherry-pick to the release tag. Being another patch to an existing release, the
release candidate for a patch release can be released after 2 business days.

### Post-mortems

We are doing public post-mortems in the following cases:

- We are unable to create a viable release candidate 2 business days after the target day,
- We are unable to release a candidate by the end of the month,
- An emergency patch release is needed (a regression that cause the current binary to increase
  the support load, e.g. several users report the same issue after a package manager update to
  the new release).

### Testing

We run nightly build of all the projects running on [ci.bazel.io](http://ci.bazel.io) using Bazel
binaries built at head, and using the release binaries. We notify projects going to be impacted by a
breaking change. Google's internal continuous integraion test run all the applicable build targets
at Google nightly.

When a release candidate is issued, we test more projects at Google like [TensorFlow](https://tensorflow.org)
on their complete test suite using the release candidate binaries. If you have a critical project
using Bazel, we recommend that you establish an automated testing process that tracks the current
release candidate, and report any regressions.

### Release versioning

Version 0.1 is our first release marking the start of our beta phase. Until version 1.0.0, we
increase the MINOR version every time we do a new full release. We increase the PATCH version
when a regression is found on a release that necessitates a new release.

Version 1.0.0 marks the end of our beta phase; afterwards, we will label each release with a
version number of the form MAJOR.MINOR.PATCH according to the
[semantic version 2.0.0 document](http://semver.org).

## Current Status

### Built-In Rules and the Internal API For Rules

We are planning a number of changes to the APIs between the core of Bazel and the built-in rules,
in order to make it easier for us to develop openly. This has the added benefit of also making it
easier for users to maintain their own rules (if written in Java instead of Starlark), if they don't
want to or cannot check this code into our repository. However, it also means our internal API is
not stable yet. In the long term, we want to move to Starlark wholesale, so we ask contributors
to use Starlark instead of Java when writing new rules. Rewriting all of our built-in rules is going
to be a lengthy process however.

1. We will fix the friction points that we know about, as well as those that we discover every time
   we make changes that span both the internal and external depots.
2. We will drive a number of pending API cleanups to completion, as well as run anticipated cleanups
   to the APIs, such as disallowing access to the file system from rule implementations (because
   it's not hermetic).
3. We will enumerate the internal rule APIs, and make sure that they are appropriately marked (for
   example with annotations) and documented. Just collecting a list will likely give us good
   suggestions for further improvements, as well as opportunities for a more principled API review
   process.
4. We will work on removing (legacy) Google-internal features to reduce the amount of differences
   between the internal and external rule sets.
5. We will encourage our engineers to make changes in the external depot first, and migrate them to
   to the internal one afterwards.
6. We will move more of our rule implementations into the open source repository (Android, Go,
   Python, the remaining C++ rules), even if we don't consider the code to be *ready* or if they are
   still missing tools to work properly.


### Stable
We expect the following rules and features to be stable. They are widely used within Google, so
our internal testing should ensure that there are no major breakages.

<table class="table table-condensed table-striped table-bordered">
  <colgroup>
    <col class="support-col-rules" />
    <col class="support-col-notes" />
  </colgroup>
  <thead>
    <tr>
      <th>Rules</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>C/C++ rules except <code>cc_toolchain</code> and <code>cc_toolchain_suite</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Java rules except <code>java_toolchain</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Android rules except <code>android_ndk_repository</code> and
        <code>android_sdk_repository</code></td>
      <td></td>
    </tr>
    <tr>
      <td><code>genrule</code></td>
      <td></td>
    </tr>
    <tr>
      <td><code>genquery</code></td>
      <td></td>
    </tr>
    <tr>
      <td><code>test_suite</code></td>
      <td></td>
    </tr>
    <tr>
      <td><code>filegroup</code></td>
      <td></td>
    </tr>
    <tr>
      <td><code>config_setting</code></td>
      <td>
        <ul>
          <li>This rule is used in <code>select()</code> expressions. We have hundreds of uses, so
            we expect the basic functionality to be stable. That said, there are some common use
            cases that are not covered yet, or that require workarounds. For example, it's not
            easily possible to select on information specified in a CROSSTOOL file, such as the
            target abi. Another example is that it's not possible to OR multiple conditions,
            leading to duplicated entries in the select.
          </li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>


### Unstable
These rules and features have known limitations that we will likely address in future releases.

<table class="table table-condensed table-striped table-bordered">
  <colgroup>
    <col class="support-col-rules" />
    <col class="support-col-notes" />
  </colgroup>
  <thead>
    <tr>
      <th>Feature</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>cc_toolchain</code> and <code>cc_toolchain_suite</code></td>
      <td>
        <ul>
          <li>We intend to make significant changes to the way C/C++ toolchains are defined; we will
            keep our published C/C++ toolchain definition(s) up to date, but we make no guarantees for
            custom ones.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>iOS/Objective C rules</td>
      <td>
        <ul>
          <li>We cannot vouch for changes made by Apple &reg; to the underlying tools and
            infrastructure.</li>
          <li>The rules are fairly new and still subject to change; we try to avoid breaking changes,
            but this may not always be possible.</li>
          <li>No testing support yet.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Python rules</td>
      <td>
        <ul>
          <li>The rules support neither Python 3, C/C++ extensions, nor packaging.
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Extra actions (<code>extra_action</code>, <code>action_listener</code>)</td>
      <td>
        <ul>
          <li>Extra actions expose information about Bazel that we consider to be implementation
            details, such as the exact interface between Bazel and the tools we provide; as such,
            users will need to keep up with changes to tools to avoid breakage.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>environment_group</code></td>
      <td>
        <ul>
          <li>We're planning to use it more extensively, replacing several machine-enforceable
            constraint mechanism, but there's only a handful of uses so far. We fully expect it to
            work, but there's a small chance that we have to go back to the drawing board.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>android_ndk_repository</code> and <code>android_sdk_repository</code></td>
      <td>
        <ul>
          <li>We don't support pre-release NDKs or SDKs at this time. Furthermore, we may still
            make backwards-incompatible changes to the attributes or the semantics.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>Fileset</code></td>
      <td>
        <ul>
          <li>There are vestiges of Fileset / FilesetEntry in the source code, but we do not intend to
            support them in Bazel, ever.</li>
          <li>They're still widely used internally, and are therefore unlikely to go away in the near
            future.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
