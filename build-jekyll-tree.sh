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

set -eu

readonly OUTPUT=${PWD}/$1
readonly JEKYLL_BASE=${PWD}/$2
readonly REDIRECTS_FILE=${3:-""}

readonly OWD=${PWD}

# Create temporary directory that is removed when this script exits.
readonly TMP=$(mktemp -d "${TMPDIR:-/tmp}/tmp.XXXXXXXX")
readonly OUT_DIR="$TMP/out"
trap "rm -rf ${TMP}" EXIT

function main {
  mkdir -p "$OUT_DIR"
  cd "$OUT_DIR"
  tar -xf "${JEKYLL_BASE}"

  if [[ -n "$REDIRECTS_FILE" ]]; then
    local redirects_path="${OWD}/${REDIRECTS_FILE}"
    while IFS=$'\t' read old new; do
      if [[ -e "$old" ]]; then
        echo "Cannot create redirect file $old. File exists."
        exit 1
      fi
      local old_dir=$(dirname $old)
      if [[ ! -d "$old_dir" ]]; then
        mkdir -p "$old_dir"
      fi
      cat <<EOF > $old
<html>
  <head>
    <script>
      window.location.replace("${new}" + window.location.hash);
    </script>
  </head>
</html>
EOF
    done < "$redirects_path"
  fi

  mv bazel_release.pub.gpg bazel-release.pub.gpg

  tar -hcf $OUTPUT $(find . -type f | sort)
}

main
