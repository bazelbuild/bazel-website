load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

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
            "LICENSE",
            "CONTRIBUTING",
            "production/**",
            "README.md",
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
    name = "jekyll-base",
    deps = [
        ":bootstrap-css",
        ":bootstrap-images",
        ":bootstrap-js",
        ":font-awesome-css",
        ":font-awesome-font",
        ":jekyll-files",
    ],
)

# Workaround to rename bazel_release.pub.gpg to bazel-release.pub.gpg in order
# to not break links.
# TODO(dzc): Remove this script and its associated build step once
# bazelbuild/bazel#2909 is fixed.
genrule(
    name = "jekyll-tree",
    srcs = [":jekyll-base"],
    outs = ["jekyll-tree.tar"],
    cmd = "$(location jekyll-tree.sh) $@ $(location :jekyll-base)",
    tools = ["jekyll-tree.sh"],
)
