---
layout: contribute
title: Guide for Bazel Maintainers
---

# Guide for Bazel Maintainers

## Table of Contents
{:.no_toc}

* ToC 
{:toc}

## Overview

This is a guide for the maintainers of the Bazel open source project.

If you are looking to contribute to Bazel, please read [Contributing to
Bazel](/contributing.html) instead.

The objectives of this document are to:

1. Serve as the maintainers' source of truth for the project’s contribution
   process.
1. Set expectations between the community contributors and the project
   maintainers.

Bazel's [core group of contributors](/governance.html) has dedicated subteams to
manage aspects of the open source project. These are:

* **User Onboarding**: Improve the experience for new Bazel users, and help them
  get started.
* **Release Process**: Manage Bazel's release process.
* **Green Team**: Grow a healthy ecosystem of rules and tools.
* **Developer Experience**: Encourage external contributions, make our
  development workflow more open, and shift the team towards GitHub-first
  development.

## Releases

* [Release Playbook](https://github.com/bazelbuild/continuous-integration/blob/master/docs/release-playbook.md)
* [Testing local changes with downstream projects](https://github.com/bazelbuild/continuous-integration/blob/master/docs/downstream-testing.md)

## Continuous Integration

Read the Green team's guide to Bazel's CI infrastructure on the
[bazelbuild/continuous-integration](https://github.com/bazelbuild/continuous-integration/blob/master/buildkite/README.md)
repository.

## Lifecycle of an Issue

1. A user creates an issue using the [Issue
   Template](https://github.com/bazelbuild/bazel/blob/master/ISSUE_TEMPLATE.md)
   and it enters the pool of [unreviewed open
   issues](https://github.com/bazelbuild/bazel/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aopen+-label%3Auntriaged+-label%3Ap2+-label%3Ap1+-label%3Ap3+-label%3Ap4+-label%3Ateam-Starlark+-label%3Ateam-Rules-CPP+-label%3Ateam-Rules-Java+-label%3Ateam-Engprod++-label%3Ateam-Execution+-label%3Ateam-Product+-label%3Ateam-Android+-label%3Ateam-Apple+-label%3Ateam-ExternalDeps+-label%3Ateam-Configurability++-label%3Ateam-Performance+-label%3Ateam-EngProd++-label%3Ateam-Rules-Server+-label%3Ateam-Windows).
1. A member on the Developer Experience (DevEx) subteam rotation reviews the
   issue.
  1. If the issue is **not a bug** or a **feature request**, the DevEx member
     will close the issue and redirect the user to
     [StackOverflow](https://stackoverflow.com/questions/tagged/bazel) and
     [bazel-discuss](https://groups.google.com/forum/#!forum/bazel-discuss) for
     higher visibility on the question.
  1. If the issue is vague or has missing information, the DevEx member will
     assign the issue back to the user to request for more information before
     continuing. This usually occurs when the user does not follow the [Issue
     Template](https://github.com/bazelbuild/bazel/blob/master/ISSUE_TEMPLATE.md).
1. After reviewing the issue, the DevEx member decides if the issue requires
   immediate attention. If it does, they will assign the **P0**
   [priority](#priority) label and an owner from the list of team leads.
1. The DevEx member assigns the `untriaged` label and exactly one [team
   label](#team-labels) for routing.
1. The DevEx member also assigns the `bug` or `feature request` label according
   to the type of the issue.

At this stage, the issue enters the pool of [untriaged open
issues](https://github.com/bazelbuild/bazel/issues?q=is%3Aissue+is%3Aopen+label%3Auntriaged).

Each Bazel subteam will triage all issues under labels they own, preferably on a
weekly basis. The subteam will review and evaluate the issue and provide a
resolution, if possible. If you are a owner of a team label, see [this section
](maintainers-guide.html#my-team-owns-a-label-what-should-i-do) for more
information.

When an issue is resolved, it can be closed.

## Lifecycle of a Pull Request

1. A user creates a pull request.
1. If you a member of a Bazel team and sending a PR against your own area,
   you are responsible for assigning your team label and finding the best
   reviewer.
1. Otherwise, during daily triage, a DevEx member assigns one
   [team label](#team-labels) and the team's technical lead (TL) for routing.
   1. The TL may optionally assign someone else to review the PR.
1. The assigned reviewer reviews the PR and works with the author until it is
   approved or dropped.
1. If approved, the reviewer **imports** the PR's commit(s) into Google's
   internal version control system for further tests. As Bazel is the same build
   system used internally at Google, we need to test all PR commits against the
   internal test suite. This is the reason why we do not merge PRs directly.
1. If the imported commit passes all internal tests, the commit will be squashed
   and exported back out to GitHub.
1. When the commit merges into master, GitHub automatically closes the PR.

## Initial routing

When someone opens a new issue or pull request (PR) on Bazel's GitHub
repository, it needs to be routed to the appropriate owners for **triaging**.

For a large project like Bazel, routing issues and PRs in a timely manner has
many benefits, including:

1. Acknowledging the contributor's time and effort to open an issue or PR.
1. Maximizing the visibility of the issue or PR towards domain experts.
1. Reducing the maintainers' toil on sifting through the large volume of issues
   and PRs.

When an issue or PR is routed to the correct owner, the owner can address and
prioritize the issue accordingly.

The Developer Experience (DevEx) subteam handles the initial routing of issues
and PRs on weekly rotation basis. The subteam can be reached on GitHub using the
`@bazelbuild/devex` alias.

Routed issues **must have**:

1. a `team` label, e.g. `team-Starlark`
2. either the `untriaged` label OR one priority label (`p0`, `p1`, `p2`, `p3`, `p4`), but not both.

The exceptions to this are issues for tracking releases and incompatible changes.

See the list of issues to be routed
[here](https://github.com/bazelbuild/bazel/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aopen+-label%3Ap1+-label%3Ap2+-label%3Ap3+-label%3Ap4+-label%3Auntriaged+-label%3Ap0+-label%3Arelease+-label%3Aincompatible-change).

## My team owns a label. What should I do?

Subteams need to triage all issues in the [labels they own](#team-labels),
preferable on a weekly basis.

### Issues

1. Filter the list of issues by your team label **and** the `untriaged` label.
1. Review the issue.
1. Identify a [priority level](#priority) and assign the label.
  1. The issue may have already been prioritized by the DevEx subteam if it's a
     P0. Re-prioritize if needed.
1. Remove the `untriaged` label.

Note that you need to be in the [bazelbuild
organization](https://github.com/bazelbuild) to be able to add or remove labels.

### Pull Requests

1. Filter the list of pull requests by your team label.
1. Review open pull requests.
  1. **Optional**: If you are assigned for the review but is not the right fit
  for it, re-assign the appropriate reviewer to perform a code review.
1. Work with the pull request creator to complete a code review.
1. Approve the PR.
1. Ensure that all tests pass.
1. Import the patch to the internal version control system and run the internal
   presubmits.
1. Submit the internal patch. If the patch submits and exports successfully, the
   PR will be closed automatically by GitHub.

## Priority

The following definitions for priority will be used by the maintainers to triage
issues.

* [**P0**](https://github.com/bazelbuild/bazel/labels/P0) - Major broken
  functionality that causes a Bazel release (minus release candidates) to be
  unusable, or a downed service that severely impacts development of the Bazel
  project. This includes regressions introduced in a new release that blocks a
  significant number of users, or an incompatible breaking change that was not
  compliant to the [Breaking
  Change](https://docs.google.com/document/d/1q5GGRxKrF_mnwtaPKI487P8OdDRh2nN7jX6U-FXnHL0/edit?pli=1#heading=h.ceof6vpkb3ik)
  policy. No practical workaround exists.
* [**P1**](https://github.com/bazelbuild/bazel/labels/P1) - Critical defect or
  feature which should be addressed in the next release, or a serious issue that
  impacts many users (including the development of the Bazel project), but a
  practical workaround exists. Typically does not require immediate action. In
  high demand and planned in the current quarter's roadmap.
* [**P2**](https://github.com/bazelbuild/bazel/labels/P2) - Defect or feature
  that should be addressed but we don't currently work on. Moderate live issue
  in a released Bazel version that is inconvenient for a user that needs to be
  addressed in an future release and/or a easy workaround exists.
* [**P3**](https://github.com/bazelbuild/bazel/labels/P3) - Desirable minor bug
  fix or enhancement with small impact. Not prioritized into Bazel roadmaps or
  any imminent release. May never be fixed.
* [**P4**](https://github.com/bazelbuild/bazel/labels/P4) - Low priority defect
  or feature request that is unlikely to get closed. Can also be kept open for a
  potential re-prioritization if more users are impacted.
* [**ice-box**](https://github.com/bazelbuild/bazel/issues?q=label%3Aice-box+is%3Aclosed)
  - Issues that we currently don't have time to deal with nor the
  time to accept contributions. We will close these issues to indicate that
  nobody is working on them, but will continue to monitor their validity over
  time and revive them if enough people are impacted and if we happen to have
  resources to deal with them. As always, feel free to comment or add reactions
  to these issues even when closed.

## Team labels

*   [`team-Android`](https://github.com/bazelbuild/bazel/labels/team-Android): Issues for Android team
    *   Contact: [ahumesky](https://github.com/ahumesky)
*   [`team-Apple`](https://github.com/bazelbuild/bazel/labels/team-Apple): Issues for Apple team (also MacOS, iOS etc)
    * Contact: [jmmv](https://github.com/jmmv)
*   [`team-Bazel`](https://github.com/bazelbuild/bazel/labels/team-Bazel): General Bazel product/strategy issues
    * Contact: [sventiffe](https://github.com/sventiffe)
*   [`team-Configurability`](https://github.com/bazelbuild/bazel/labels/team-Configurability): Issues for Configurability team
    * Contact: [gregestren](https://github.com/gregestren)
*   [`team-Core`](https://github.com/bazelbuild/bazel/labels/team-Core): Issues for Core team
    * Contact: [janakdr](https://github.com/janakdr)
*   [`team-Front-End`](https://github.com/bazelbuild/bazel/labels/team-Front-End): Issues for the Bazel Front End team
    * Contact: [laurentlb](https://github.com/laurentlb)
*   [`team-Local-Exec`](https://github.com/bazelbuild/bazel/labels/team-Local-Exec): Issues for Execution (Local) team
    * Contact: [jmmv](https://github.com/jmmv)
*   [`team-Performance`](https://github.com/bazelbuild/bazel/labels/team-Performance): Issues for Bazel Performance team
    * Contact: [meisterT](https://github.com/meisterT)
*   [`team-Remote-Exec`](https://github.com/bazelbuild/bazel/labels/team-Remote-Exec): Issues for Execution (Remote) team
    * Contact: ?
*   [`team-Rules-CPP`](https://github.com/bazelbuild/bazel/labels/team-Rules-CPP): Issues for C++ rules
    * Contact: [lberki](https://github.com/lberki)
*   [`team-Rules-Java`](https://github.com/bazelbuild/bazel/labels/team-Rules-Java): Issues for Java rules
    * Contact: [lberki](https://github.com/lberki)
*   [`team-Rules-Python`](https://github.com/bazelbuild/bazel/labels/team-Rules-Python): Issues for the native Python rules
    * Contact: [lberki](https://github.com/lberki)
*   [`team-Rules-Server`](https://github.com/bazelbuild/bazel/labels/team-Rules-Server): Issues for serverside rules included with Bazel
    * Contact: [lberki](https://github.com/lberki)
*   [`team-Starlark`](https://github.com/bazelbuild/bazel/labels/team-Starlark): Issues for Starlark language + Build API
    * Contact: [laurentlb](https://github.com/laurentlb)
*   [`team-XProduct`](https://github.com/bazelbuild/bazel/labels/team-XProduct): Issues for Product Excellence team: installation, Bazel packaging, website, command line processing, Bazel CI, Windows, releases / distributions, external repositories
    * Contact: [philwo](https://github.com/philwo)

For new issues, we deprecated the `category: *` labels in favor of the team labels.

See the full list of labels [here](https://github.com/bazelbuild/bazel/labels).
