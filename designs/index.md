---
layout: contribute
title: Design Documents
---

# Design Documents

The list of design documents is published on the [Bazel Proposals Repository](https://github.com/bazelbuild/proposals).

It's possible that designs change as they are implemented in practice. The
published design documents capture the initial design, and _not_ the ongoing
changes as designs are implemented.

Always go to the [documentation]({{ site.docs_site_url }}) for descriptions of
current Bazel functionality.


## When do I need a design document and review?

If you're planning to add, change, or remove a user-facing feature, or make a
significant architectural change to Bazel, you **must** write a design document
and have it reviewed before you can submit the change. See [What is a
significant change?](#what-is-a-significant-change) for details.

Implementation can begin before the proposal is accepted, for example as a
proof-of-concept or an experimentation. However, you cannot submit the change
before the review is complete.


## Workflow


### Write the design document

All design documents must have a header that includes:

*   author
*   date of last major change
*   list of reviewers, including one (and only one) [lead reviewer](#how-to-choose-a-lead-reviewer)
*   current status (_draft_, _in review_, _approved_, _rejected_, _being implemented_, _implemented_)
*   link to discussion thread (_to be added after the announcement_)

The document can be written either [as a world-readable Google Doc](#using-google-docs)
or [using Markdown](#using-markdown). Read below about for a
[Markdown / Google Docs comparison](#should-i-use-markdown-or-google-docs).

Proposals that have a user-visible impact must have a section documenting the
impact on backward compatibility (and a rollout plan if needed).


### Create a Pull Request

The author creates a PR to add the document to [the design index](https://github.com/bazelbuild/proposals). If
the proposal is a Markdown file, the file is added in the same PR. Otherwise,
the PR only adds a link.

When possible, the author [chooses a lead reviewer](#how-to-choose-a-lead-reviewer).
Other reviewers are cc'ed. If the author didn't choose a lead reviewer, the
Bazel sheriff will assign one, like for any other PR.

Once the PR is sent, the reviewers can make some preliminary comments during the
code review. For example, the lead reviewer can suggest extra reviewers, or
point out missing information. The lead reviewer approves the PR when they
believe the review process can start. It doesn't mean the proposal is perfect or
will be approved; it means that the proposal contains enough information to
start the discussion.


### Announce the new proposal

Once the PR is submitted, the author sends an announcement to [bazel-dev](https://groups.google.com/forum/#!forum/bazel-dev).

Other groups may be cc'ed (e.g. [bazel-discuss](https://groups.google.com/forum/#!forum/bazel-discuss),
to get feedback from Bazel end-users).


### Iterate with reviewers

Anyone interested can chime in and comment on the proposal. The author should
try to answer questions, clarify the proposal, and address the concerns.

Discussion should happen on the announcement thread. If the document is a Google
Doc, comments may be used instead (but note that anonymous comments are
allowed).


### Update the status

When the author believes the iteration round is complete, they send a new PR to
update the status. The PR must be sent to the same lead reviewer and cc the
other reviewers.

The lead reviewer approves the PR to officially accept the proposal.
It is the lead reviewer's responsibility to ensure that other reviewers agree
with the decision.

There must be at least 1 week between the first announcement and the approval of
a proposal. This ensures that users had enough time to read the document and
share their concerns.


## Should I use Markdown or Google Docs?

Both are accepted. The author can decide what works best for them.

Google Docs can be more effective for brainstorming, collaborative editing, and
quick iteration. Suggested edits are also very valuable.

Markdown files have some other benefits, including:

*   Clean URLs for linking.
*   Explicit record of revisions.
*   No forgetting to set up access rights before publicizing a link.
*   More easily searchable with search engines.
*   Future-proofness: plain text is not at the mercy of any specific tool,
    doesn't require an Internet connection.
*   It is possible to update them even if the author is not around anymore.
*   They can be processed automatically (e.g. update/detect dead links, fetch
    list of authors, etc.).

It is also possible to first iterate on a Google Doc, and then convert it to
Markdown for posterity.


## Using Google Docs

Create a world-readable document on [Google Doc](https://docs.google.com). To 
make it world-readable, click on "Share", "Advanced", then "Change…", and
choose "On - Anyone with the link". You may allow comments on the document. If
you do so, anyone will be able to comment anonymously, even without a Google
account.


## Using Markdown

Documents are stored on GitHub and use the GitHub flavor of Markdown
([overview](https://guides.github.com/features/mastering-markdown/),
[specification](https://github.github.com/gfm/)).

Send a PR to update an existing document. Significant changes should be reviewed
by the document reviewers. Trivial changes (e.g. typos, formatting) can be
approved by anyone.


## How to choose a lead reviewer?

The lead reviewer is a domain expert. Lead reviewers must be:

*   Knowledgeable of the relevant subsystems
*   Objective (i.e., capable of providing constructive feedback)
*   Available for the entire review period to lead the process


## I'm a reviewer. What are my responsibilities?


### When you receive a new proposal

*   Take a quick look at the document. Comment if critical information is
    missing, or if the design doesn't fit with the goals of the project.
*   Suggest additional reviewers.
*   Approve the PR when it is ready for review.


### During the review process

*   Engage in a dialogue with the design author about issues that are
    problematic or require clarification.
*   If appropriate, invite comments from non-reviewers who should be aware of
    the design.
*   Decide which comments must be addressed by the author as a prerequisite to approval.
*   Write "LGTM" (_Looks Good To Me_) in the discussion thread when you are
    happy with the current state of the proposal.

If you get a design review request, please make sure it followed this process.
Do not approve designs affecting Bazel if they are not in the [design
index](https://github.com/bazelbuild/proposals).


## I'm a lead reviewer. Do I have any additional responsibilities?

You're ultimately responsible for making a go/no-go decision on implementation
of a pending design. If you're not able to do this, you should identify a
suitable delegate (reassign the PR to the delegate), or reassign the bug to a
Blaze manager for further disposition.


### During the review process

*   Ensure that the comment and design iteration process moves forward
    constructively.
*   Prior to approval, ensure that concerns from other reviewers have been
    resolved.


### Once the design has been approved by all reviewers

*   Make sure there has been at least 1 week since the announcement on a
    mailing-list.
*   Make sure the PR updates the status.
*   Approve the PR sent by the proposal author.


### To reject the design

*   Make sure the PR author sends a PR; or send them a PR.
*   The PR updates the status of the document.
*   Add a comment to the document explaining why the design can't be approved in
    its current state, and outlining next steps, if any (e.g., "revisit invalid
    assumptions and resubmit").


## What is a significant change?


There are no hard and fast criteria, but here are some examples:

*   Addition or deletion of native build rules
*   Breaking-changes to native rules
*   Changes to a native build rule semantics that affect the behavior of more
    than a single rule
*   Changes to Bazel's rule definition API
*   Changes to the APIs that Bazel uses to connect to other systems
*   Changes to the Skylark language, semantics, or APIs
*   Changes that could have a pervasive effect on Bazel performance or memory
    usage (for better or for worse)
*   Changes to widely used internal APIs
*   Changes to flags and command-line interface.

When a proposal adds, removes, or modifies any function or object available in
BUILD, WORKSPACE, or bzl files, Skylark team has to be in the reviewers list.


## Why do we need design reviews?

*   Bazel is a very complex system; seemingly innocuous local changes can have
    significant global consequences.
*   The team gets many feature requests from users; such requests need to be
    evaluated not only for technical feasibility but importance with regards to
    other feature requests.
*   Bazel features are frequently implemented by people outside the core team;
    such contributors have widely varying levels of Bazel expertise.
*   The Bazel team itself has varying levels of expertise; no single team member
    has a complete understanding of every corner of Bazel.
*   Changes to Bazel must account for backward compatibility and avoid breaking
    changes.


## Why do we need a design review policy?

*   To maximize the likelihood that all feature requests get a baseline level of
    scrutiny.
*   To maximize the likelihood that the right people will weigh in on designs
    before we've invested in an implementation that may not work.
