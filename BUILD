load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("//:redirects.bzl", "BAZEL_SITE_REDIRECTS")
load("//:site.bzl", "site_tar")
load("//scripts:jekyll.bzl", "jekyll_build")

sh_binary(
    name = "build-jekyll-tree",
    srcs = ["build-jekyll-tree.sh"],
)

filegroup(
    name = "jekyll-srcs",
    srcs = glob(
        ["**/*"],
        exclude = [
            ".git/**",
            "bazel-*/**",
            "BUILD",
            "WORKSPACE",
            "scripts/**",
            "*.swp",
            "*.sh",
            "LICENSE",
            "CONTRIBUTING",
            "production/**",
            "README.md",
            "*.bzl",
        ],
    ),
)

pkg_tar(
    name = "jekyll-files",
    files = [":jekyll-srcs"],
    strip_prefix = ".",
)

pkg_tar(
    name = "bootstrap-css",
    files = ["//third_party/css/bootstrap:bootstrap_css"],
    package_dir = "assets",
    strip_prefix = "/third_party/css/bootstrap",
)

pkg_tar(
    name = "bootstrap-images",
    files = ["//third_party/css/bootstrap:bootstrap_images"],
    package_dir = "assets",
    strip_prefix = "/third_party/css/bootstrap",
)

pkg_tar(
    name = "instantsearch-css",
    files = ["//third_party/css/instantsearch:instantsearch_css"],
    package_dir = "assets",
    strip_prefix = "/third_party/css/instantsearch",
)

pkg_tar(
    name = "font-awesome-css",
    files = ["//third_party/css/font_awesome:font_awesome_css"],
    package_dir = "assets",
    strip_prefix = "/third_party/css/font_awesome",
)

pkg_tar(
    name = "font-awesome-font",
    files = ["//third_party/css/font_awesome:font_awesome_font"],
    package_dir = "assets",
    strip_prefix = "/third_party/css/font_awesome",
)

pkg_tar(
    name = "bootstrap-js",
    files = ["//third_party/javascript/bootstrap:bootstrap_js"],
    package_dir = "assets",
    strip_prefix = "/third_party/javascript/bootstrap",
)

pkg_tar(
    name = "instantsearch-js",
    files = ["//third_party/javascript/instantsearch:instantsearch_js"],
    package_dir = "assets",
    strip_prefix = "/third_party/javascript/instantsearch",
)

pkg_tar(
    name = "jekyll-base",
    deps = [
        ":bootstrap-css",
        ":bootstrap-images",
        ":bootstrap-js",
        ":font-awesome-css",
        ":font-awesome-font",
        ":instantsearch-css",
        ":instantsearch-js",
        ":jekyll-files",
    ],
)

site_tar(
    name = "jekyll-tree",
    src = ":jekyll-base",
    redirects = BAZEL_SITE_REDIRECTS,
)

jekyll_build(
    name = "site",
    srcs = [":jekyll-tree"],
    bucket = "www.bazel.build",
)
