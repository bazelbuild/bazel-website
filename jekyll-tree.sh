#!/bin/bash
# Copyright 2016 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Workaround to rename bazel_release.pub.gpg to bazel-release.pub.gpg in order
# to not break links.
# TODO(dzc): Remove this script and its associated build step once
# bazelbuild/bazel#2909 is fixed.

set -eu

readonly OUTPUT=${PWD}/$1
shift
readonly JEKYLL_BASE=${PWD}/$1

# Create temporary directory that is removed when this script exits.
readonly TMP=$(mktemp -d "${TMPDIR:-/tmp}/tmp.XXXXXXXX")
readonly OUT_DIR="$TMP/out"
trap "rm -rf ${TMP}" EXIT

function main {
  mkdir -p "$OUT_DIR"
  cd "$OUT_DIR"
  tar -xf "${JEKYLL_BASE}"
  mv bazel_release.pub.gpg bazel-release.pub.gpg
  tar -hcf $OUTPUT $(find . -type f | sort)
}

main
