---
layout: contribute
title: Docs style
---

# Bazel docs style guide

Thank you for contributing to Bazel's documentation. This serves as a quick
documentation style guide to get you started. For any style questions not
answered by this guide, follow the
[Google developer documentation style guide](https://developers.google.com/style).

## Defining principles

Bazel docs should uphold these principles:

-  **Concise.** Use as few words as possible.
-  **Clear.** Use plain language. Write without jargon for a fifth-grade
   reading level.
-  **Consistent.** Use the same words or phrases for repeated concepts
   throughout the docs.
-  **Correct.** Write in a way where the content stays correct for as long as
   possible by avoiding time-based information and promises for the future.

## Writing

This section contains basic writing tips.

### Headings

-  Page-level headings start at H2. (H1 headings are used as page titles.)
-  Make headers as short as is sensible. This way, they fit in the TOC
   without wrapping.
   -  **YES:** Permissions
   -  **NO:** A brief note on permissions

-  Use sentence case for headings
   -  **YES:** Set up your workspace
   -  **NO:** Set Up Your Workspace

-  Try to make headings task-based or actionable. If headings are conceptual,
   it may be based around understanding, but write to what the user does.
   -  **YES:** Preserving graph order
   -  **NO:** On the preservation of graph order

### Names

-  Capitalize proper nouns, such as Bazel and Starlark.
   -  **YES:** At the end of the build, Bazel prints the requested targets.
   -  **NO:** At the end of the build, bazel prints the requested targets.

-  Keep it consistent. Don't introduce new names for existing concepts. Where
   applicable, use the term defined in the
   [Glossary](https://docs.bazel.build/glossary.html).
   -  For example, if you're writing about issuing commands on a
      terminal, don't use both terminal and command line on the page.

### Page scope

-  Each page should have one purpose and that should be defined at the
   beginning. This helps readers find what they need quicker.
   -  **YES:** This page covers how to install Bazel on Windows.
   -  **NO:** (No introductory sentence.)

-  At the end of the page, tell the reader what to do next. For pages where
   there is no clear action, you can include links to similar concepts,
   examples, or other avenues for exploration.

### Subject

In Bazel documentation, the audience should primarily be users—the people using
Bazel to build their software.

-  Address your reader as "you". (If for some reason you can't use "you",
   use gender-neutral language, such as they.)
   -  **YES:** To build Java code using Bazel, you must install a JDK.
   -  MAYBE: For users to build Java code with Bazel, they must install a JDK.
   -  **NO:** For a user to build Java code with Bazel, he or she must install
      a JDK.

-  If your audience is NOT general Bazel users, define the audience at the
   beginning of the page or in the section. Other audiences can include
   maintainers, contributors, migrators, or other roles.
-  Avoid "we". In user docs, there is no author; just tell people what's
   possible.
   -  **YES:** As Bazel evolves, you should update your code base to maintain
      compatibility.
   -  **NO:** Bazel is evolving, and we will make changes to Bazel that at
      times will be incompatible and require some changes from Bazel users.

### Temporal

Where possible, avoid terms that orient things in time, such as referencing
specific dates (Q2 2020) or saying "now", "currently", or "soon."  These go
stale quickly and could be incorrect if it's a future projection. Instead,
specify a version level instead, such as "Bazel X.x and higher supports
\<feature\>" or a GitHub issue link.

-  **YES:** Bazel 0.10.0 or later supports remote caching.
-  **NO:** Bazel will soon support remote caching, likely in October 2017.

### Tense

-  Use present tense. Avoid past or future tense unless absolutely necessary
   for clarity.
   -  **YES:** Bazel issues an error when it finds dependencies that don't
      conform to this rule.
   -  **NO:**  If Bazel finds a dependency that does not conform to this rule,
      Bazel will issue an error.

-  Where possible, use active voice (where a subject acts upon an object) not
   passive voice (where an object is acted upon by a subject). Generally,
   active voice makes sentences clearer because it shows who is responsible. If
   using active voice detracts from clarity, use passive voice.
   -  **YES:** Bazel initiates X and uses the output to build Y.
   -  **NO:** X is initiated by Bazel and then afterward Y will be built with
      the output.

### Tone

Write with a business friendly tone.

-  Avoid colloquial language. It's harder to translate phrases that are
   specific to English.
   -  **YES:** Good rulesets
   -  **NO:** So what is a good ruleset?

-  Avoid overly formal language. Write as though you're explaining the
   concept to someone who is curious about tech, but doesn't know the details.

## Formatting

### File type

Where possible, use Markdown instead of HTML in your files. Follow the
[GitHub Markdown Syntax Guide](https://guides.github.com/features/mastering-markdown/#syntax)
for recommended Markdown style.

For readability, wrap lines at 80 characters. Long links or code snippets
may be longer, but should start on a new line. For example:

```
Where possible, use Markdown instead of HTML in your files. Follow the
[GitHub Markdown Syntax Guide](https://guides.github.com/features/mastering-markdown/#syntax)
for recommended Markdown style.
```


### Links

-  Use descriptive link text instead of "here" or "below". This practice
   makes it easier to scan a doc and is better for screen readers.
   -  **YES:** For more details, see [Installing Bazel].
   -  **NO:** For more details, see [here].

-  End the sentence with the link, if possible.
   -  **YES:** For more details, see [link].
   -  **NO:** See [link] for more information.

### Lists

-  Use an ordered list to describe how to accomplish a task with steps
-  Use an unordered list to list things that aren't task based. (There should
   still be an order of sorts, such as alphabetical, importance, etc.)
-  Write with parallel structure. For example:
   1. Make all the list items sentences.
   1. Start with verbs that are the same tense.
   1. Use an ordered list if there are steps to follow.

### Placeholders

-  Use angle brackets to denote a variable that users should change.
   In Markdown, escape the angle brackets with a back slash: `\<example\>`.
   -  **YES:** `bazel help <command>`: Prints help and options for `<command>`
   -  **NO:** bazel help _command_: Prints help and options for "command"

-  Especially for complicated code samples, use placeholders that make sense
   in context.

### Table of contents

Use the auto-generated TOC supported by the site. Don't add a manual TOC.

## Code

Code samples are developers' best friends. You probably know how to write these
already, but here are a few tips.

If you're referencing a small snippet of code, you can embed it in a sentence.
If you want the reader to use the code, such as copying a command, use a code
block.

### Code blocks

-  Keep it short. Eliminate all redundant or unnecessary text from a code
   sample.
-  In Markdown, specify the type of code block by adding the sample's language.

```
```shell
...
``
````

-  Separate commands and output into different code blocks.

### Inline code formatting

-  Use code style for filenames, directories, paths, and small bits of code.
-  Use inline code styling instead of _italics_, "quotes," or **bolding**.
   -  **YES:** `bazel help <command>`: Prints help and options for `<command>`
   -  **NO:** bazel help _command_: Prints help and options for "command"
