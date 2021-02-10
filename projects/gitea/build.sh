#!/bin/bash -eu
# Copyright 2020 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

mkdir $GOPATH/src/code.gitea.io
mv $SRC/gitea $GOPATH/src/code.gitea.io/
cd $GOPATH/src/code.gitea.io/gitea && go get ./...

compile_go_fuzzer code.gitea.io/gitea/tools FuzzMarkdownRenderRaw fuzz_markdown_render_raw gofuzz
compile_go_fuzzer code.gitea.io/gitea/tools FuzzMarkupPostProcess fuzz_markup_post_process gofuzz
