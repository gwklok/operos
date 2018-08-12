#!/bin/bash -xe
# Copyright 2018 Pax Automa Systems, Inc.
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

rm -rf /opt/isobuild/out/*
rsync -a --info=progress2 --delete --exclude out --exclude .git /home/vagrant/operos/. /opt/isobuild

cd /opt/isobuild
./build.sh -v -N operos -D operos "$@"
mkdir -p /home/vagrant/operos/out
cp /opt/isobuild/out/* /home/vagrant/operos/out/
