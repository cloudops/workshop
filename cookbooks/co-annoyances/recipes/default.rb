#
# Cookbook Name:: co-annoyances
# Recipe:: default
#
# Copyright 2012, CloudOps.com
#
# All rights reserved - Do Not Redistribute
#

include_recipe "co-annoyances::sysstat"

case node['platform']
when "redhat","centos","scientific","fedora"
  include_recipe "co-annoyances::rhel"
when "ubuntu","debian"
  include_recipe "co-annoyances::ubuntu"
end

# MARCHE PAS ! 
if node['base']['co_annoyances']['run_once'] == "true"
  ruby_block "remove_annoyances_from_run_list" do
    block do
      node.run_list.remove("recipe[co-annoyances]")
    end
  end
end

if node['base']['co_annoyances']['run_update'] == "true"
  include_recipe "co-annoyances::update"
end
