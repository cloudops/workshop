Description
===========
DO NOT add this cookbook to a ROLE !!!

Install missing OS package, System tools (sysstat, htop,...). Customize to OS to allow Better Ops management.


Add the co-annoyances to your node, it will automatically remove the cookbook after is execution.

to run system update add:
set: node[:base][:co_annoyances][:run_update] = "true" # set to true to run the upgrade once (yum update or apt-get update)

to keep the cookbook enable:
set: node[:base][:co_annoyances][:run_once] = "false" # set to true if you don't want to keep this one executed every run.

Requirements
============
This Cookbook should be the first to apply to a node and run only once by default.

Attributes
==========
default
  node[:base][:co_annoyances][:run_update] = "true" 
  node[:base][:co_annoyances][:run_once] = "false"
  default[:base][:missing_pkg][:ubuntu]= ["htop", "ntop", "curl", "wget", "apachetop"]
  default[:base][:missing_pkg][:centos]= ["man", "htop", "curl", "wget", "apachetop", "telnet", "vim", "atop", "tcpdump", "nc"]

sysstat
  default[:base][:sysstat_history] = "14"
  default[:base][:SADC_OPTIONS] = "-S DISK"

Usage
=====
Add this Cookbook to the system-base rule, it will automatically remove himself from the list.

Changes
=======
## v0.1.3
* 17/06/2013
* add missing package to CentOS.

## V0.1.1 
* 29/10/2012
* Minor quick fix

## v0.1.0
* 24/10/2012
* add Ubuntu 12.04 support
* initial version of this cookbook
