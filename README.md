# Bazel Website

This repository hosts the content of the Bazel website, available at https://bazel.build/
It does not contain the [Bazel documentation](https://github.com/bazelbuild/bazel/tree/master/site/docs) or the [Bazel blog](https://github.com/bazelbuild/bazel-blog).

## Prerequisites

To build the site, you will need [Jekyll](http://jekyllrb.com) version 2.5.3 or
above. For instance, it can be installed with `apt-get install jekyll` on recent
Ubuntu (tested on 16.10).

To deploy the site, you will need [gsutil](https://cloud.google.com/storage/docs/gsutil)
and to authenticate with `gcloud auth login`.

## Running the website locally

To stage the site

```
bazel run //:site
```

If you want to show the preview to others

```
HOST=$(hostname) bazel run //:site
```

See [the Jekyll site](http://jekyllrb.com/docs) if you need more info.

## Deploying the website

Deploying the website is done automatically through Google Cloud Container Builder.
If for some reason it does not work, you can run `bazel run //:site -- --push` to deploy
manually.
