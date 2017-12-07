---
layout: contribute
title: Central cache for external repositories
---

# Central cache for external repositories
## Part 1: Caching HttpDownloader values

**Author**: jingwen@google.com

**Status**: Implemented

**Reviewers**: kchodorow@, jcater@, dmarting@

## Introduction

With `bazel fetch //repo:...`, external repositories and artifacts are
downloaded from remote sources with repository functions, such as
`http_archive()` or `maven_jar()`. Sometimes, network access is not
available, or redownloading of already-downloaded repositories is
wasteful.

With a central cache, Bazel can check it for the requested
repositories before hitting the internet. This allows multiple
workspaces to share the same repository cache. The cache should also
be portable, i.e. tar’ing up the cache and reusing it on another
system.

### Related issues:

Make `maven_jar` and friends smarter by re-using previously fetched
artifacts across different projects
[#1752](https://github.com/bazelbuild/bazel/issues/1752).

## Objective

Implement an additional step prior to fetching that checks a directory
`$repository_cache` for the requested external repository. 

Note:

- This does not change the way `output_base/external` is organized. It
is delegating the actual location of the downloaded repositories to
somewhere outside of `output_base/external` (which means outside of
individual Bazel invocation folders), and symlinking to those
locations instead.
- This does not require a change in CI configuration until it’s
switched on by default. It can be used with the flag 
`--experimental_repository_cache` during the development process.

## Not in scope

- (Skylark) Reconciling caching strategies between Bazel and other tools
like Maven, which has their own strategies. It’s possible to cache the
output of `repository_ctx.execute`, while still respecting the external
tool’s caching strategy, but that is not in the scope of this design.
- Human-readable cache layouts. Simplifies inspection of cache content.
- Garbage collection / cache cleanup of non-referenced cache content.
- Using a remote filesystem as cache (NFS, ssh-fuse, etc)
- Cache invalidation

## Implementation plan

1. Implement a new command line option: `--experimental_repository_cache` 
that takes in a string argument, which is the path of the directory. This
path will be used directly in BazelRepositoryModule#handleOptions. There is
no default value for this option; the user will need to provide an absolute 
path.
  a. Acts as a feature gate until the feature is ready to become a
  default behavior, after which it’ll will be used to specify custom
  locations or turn caching off.
2. Option will be implemented in the new `RepositoryOptions` class,
which is added to `FetchCommand` and `BuildCommand`.
3. Create a class, `RepositoryCache`, that defines the caching strategy when
used in `HttpDownloader`. Skylark’s `download/download_and_extrac`t
methods will also get this caching for free.
4. Prior to downloading, if the `--repository_cache` option is
specified && the SHA checksum is specified in the download parameters
in HttpDownloader, set the cache key as the SHA checksum. If cache hit
in `$repository_cache`, skip the downloading step and copy the cache
value from `$repository_cache` to `$output_base/external`.
5. If not specified, download into `$output_base/external` as usual.
After downloading, if the `--repository_cache` option is specified and
there’s a cache miss, cache load into `$repository_cache` and create a
copy back to `$output_base/external`.

## Cache structure
- `repository_cache`: `$HOME/.cache/bazel/repository_cache`
- `content_adressable_cache`: `${repository_cache}/content_addressable`
- `sha{1, 256}_cache`: `${content_addressable_cache}/${sha{1, 256}}`
- Cache keys: SHA checksum of download. 
