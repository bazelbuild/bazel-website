---
layout: contribute
title: Bazel SIGs
---

# Bazel SIGs (Special Interest Groups)
This policy applies to http://github.com/bazelbuild.

## Scope of a SIG
Bazel hosts Special Interest Groups (SIGs) to focus collaboration on particular areas 
and to support communication and coordination between Bazel owners, maintainers and 
contributors (see [governance model](https://bazel.build/governance.html)). 

SIGs do their work in public. To join and contribute, review the work of the group, 
and get in touch with the SIG leader. Membership policies vary on a per-SIG basis.

The ideal scope for a SIG meets a well-defined domain, where the majority of participation 
is from the community. SIGs may focus on community maintained repositories in bazelbuild 
(such as language rules) or focus on areas of code in the bazel repository 
(such as on Remote Execution). 

While not all SIGs will have the same level of energy, breadth of scope, or governance 
models, there should be sufficient evidence that there are community members willing to 
engage and contribute should the interest group be established.

See the complete list of [Bazel SIGs](https://github.com/bazelbuild/community/tree/master/sigs).

### Non-goals: What a SIG is not
SIGs are intended to facilitate collaboration on shared work. A SIG is therefore:

- Not a support forum: a mailing list and a SIG is not the same thing.
- Not immediately required: early on in a project's life, you may not know if you have shared 
  work or collaborators.
- Not free labor: energy is required to grow and coordinate the work collaboratively.

Our approach to SIG creation will be conservative—thanks to the ease of starting projects on 
GitHub, there are many avenues where collaboration can happen without the need for a SIG.

## SIG lifecycle
### Research and consultation
Proposers of groups should gather evidence for approval, as specified below. Some possible 
avenues to consider are:

- A well-defined problem or set of problems the group would solve.
- Consultation with community members who would benefit, assessing both the benefit and their 
  willingness to commit.
- For existing projects, evidence from issues and PRs that contributors care about the topic.
- Potential goals for the group to achieve.
- Resource requirements of running the group.

Even if the need for a SIG seems self-evident, the research and consultation is still important 
to the success of the group.

### Creating the new group
The new group should follow the below process for chartering. In particular, it must demonstrate:

- A clear purpose and benefit to Bazel (either around a sub-project or application area)
- Two or more contributors willing to act as group leads, existence of other contributors, and 
  evidence of demand for the group
- Each group needs to use at least one publicly accessible mailing list. A SIG may reuse one of 
  the public lists, such as [bazel-discuss](https://groups.google.com/g/bazel-discuss), ask for 
  a list for @bazel.build, or create their own list.
- Resources it will initially require (usually, mailing list and regular VC call.)
- SIGs can serve documents and files from their directory in 
  [bazelbuild/community](https://github.com/bazelbuild/community) or from their own repository 
  in the [bazelbuild](https://github.com/bazelbuild) GitHub organisation. SIGs are also allowed 
  to link to external resources if they choose to organise their work outside of the bazelbuild 
  GitHub organisation. 
- Approval for the group will be given by a decision of the Bazel Owners. The team will consult 
  other stakeholders as necessary.

Before entering the formal parts of the process, it is advisable to consult with the Bazel 
product team, product@bazel.build. It is highly likely that conversation and iteration will 
be required before the SIG request is ready.

The formal request for the new group is done by submitting a charter as a PR to 
[bazelbuild/community](https://github.com/bazelbuild/community), and including the request in 
the comments on the PR (see template below). On approval, the PR for the group will be merged 
and the required resources created.

### Template Request for New SIG
This template will be available in the community repo: 
[SIG-request-template.md](https://github.com/bazelbuild/community/blob/master/governance/SIG-request-template.md).

### Chartering
Each group will be established with a charter, and be governed by the Bazel 
[code of conduct](https://bazel.build/contributing.html). Archives of the group will be public. 
Membership may either be open to all without approval, or available on request, pending approval 
of the group administrator.

The charter must nominate an administrator. As well as an administrator, the group must include 
at least one person as lead (these may be the same person), who will serve as point of contact 
for coordination as required with the Bazel product team.

This charter will be posted initially to the group mailing list. The community repository in the 
Bazel GitHub organization will archive such documents and policies. As any group evolves its 
practices and conventions, we expect it to document these within the relevant part of the 
community repository.

### Collaboration and inclusion
While it is not mandated, the group should choose to make use of collaboration via scheduled 
conference calls or chat channels to conduct meetings. Any such meetings should be advertised 
on the mailing list, and notes posted to the mailing list afterwards. Regular meeting helps 
drive accountability and progress in a SIG.

Bazel product team members will proactively monitor and encourage the group to discussion and 
action as appropriate.

### Launching
Required activities:

- Notifying Bazel general discussion groups ([bazel-discuss](https://groups.google.com/g/bazel-discuss), 
  [bazel-dev](https://groups.google.com/g/bazel-dev)).

Optional activities:

- Creating a blog post for the Bazel blog.

### Health and termination of SIGs
The Bazel product team will make a best effort to ensure the health of SIGs. From time to 
time it will request the SIG lead to provide a report of the SIG's work, which will be 
used to inform the broader Bazel community of the activity of the group.

If a SIG no longer has a useful purpose or interested community, it may be archived and 
cease operation. The Bazel product team reserves the right to archive such inactive SIGs, 
in order to maintain the health of the project at large, though it is a less preferable 
outcome. A SIG may also opt to disband if it recognizes it has reached the end of its 
useful life.

## Note
This content has been adopted from Tensorflow’s 
[SIG playbook](https://www.tensorflow.org/community/sig_playbook) with modifications.
