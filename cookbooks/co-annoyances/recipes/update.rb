#
# Cookbook Name:: co-annoyances
# Recipe:: update
#
# Copyright 2012, CloudOps.com
#
# All rights reserved - Do Not Redistribute
#

case node['platform']
  when "redhat","centos","scientific","fedora"
    execute("yum update -y") { ignore_failure true }.run_action(:run)
    
  when "ubuntu","debian"
    #freshen up the apt repository
    execute("apt-get update") { ignore_failure true }.run_action(:run)
    execute("apt-get upgrade -y") { ignore_failure true }.run_action(:run)
    
end

ruby_block "remove co-annoyances::update from run list" do
  block do
    node.run_list.remove("recipe[co-annoyances::update]")
  end
end