---
layout: contribute
title: Windows Scoop maintenance
---

# Maintaining Bazel Scoop package on Windows

**NOTE:** The Scoop package is experimental; please provide feedback (`@excitoon` in issue tracker).

## Prerequisites

You need:

*    [Scoop package manager](https://scoop.sh/) installed
*    (to publish) GitHub account in order to create pull requests to [scoopinstaller/scoop-main](https://github.com/scoopinstaller/scoop-main)
     * [@excitoon](https://github.com/excitoon) currently maintains this
       unofficial package. Feel free to ask questions by [e-mail](mailto:vladimir.chebotarev@gmail.com) or [Telegram](http://telegram.me/excitoon).

## Release process

Scoop packages are very easy to maintain. Once you've got an URL of released Bazel, you will need to make appropriate changes in [this file](https://github.com/scoopinstaller/scoop-main/blob/master/bucket/bazel.json):
- update version;
- update dependencies if needed;
- update URL;
- update hash (`sha256` by default).

In your filesystem `bazel.json` is located in the directory `%UserProfile%/scoop/buckets/main/bucket` by default. This directory belongs to your clone of a Git repository [scoopinstaller/scoop-main](https://github.com/scoopinstaller/scoop-main).

Test the result:

```
scoop uninstall bazel
scoop install bazel
bazel version
bazel something_else
```

(first time) Make a fork of [scoopinstaller/scoop-main](https://github.com/scoopinstaller/scoop-main) and specify it as your own remote for `%UserProfile%/scoop/buckets/main`:

```
git remote add mine FORK_URL
```

Push your changes to your fork and create a pull request.
