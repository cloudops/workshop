#
# Cookbook Name:: co-annoyances
# Attributes:: default
#
# Copyright 2012, CloudOps.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
default[:base][:missing_pkg][:ubuntu]= ["htop", "ntop", "curl", "wget", "apachetop", "vim"]
default[:base][:missing_pkg][:centos]= ["man", "htop", "curl", "wget", "apachetop", "telnet", "atop","iotop", "tcpdump", "nc", "ftop", "lsof", "psmisc", "parted", "bind-utils"]
default[:base][:services][:centos] = ["iptables", "ip6tables", "yum-updatesd", "bluetooth", "firstboot", "gpm", "irda", "isdn", "rhnsd", "mdmonitor", "mdmpd"]
default[:base][:co_annoyances][:run_once] = "false" # set to true if you don't want to keep this one executed every run.
default[:base][:co_annoyances][:run_update] = "false" # set to true to run the upgrade from the default recipe (yum update or apt-get update)
