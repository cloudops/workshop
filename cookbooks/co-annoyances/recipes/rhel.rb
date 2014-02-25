#
# Cookbook Name:: co-annoyances
# Recipe:: centos
#
# Copyright 2012, CloudOps.com
#
# All rights reserved - Do Not Redistribute
#

node[:base][:missing_pkg][:centos].each do |pkg|
  package(pkg) {action :install}
end

#delete any preexisting firewall rules
execute("iptables -F") { ignore_failure true }.run_action(:run)


#turn off SELinux
execute "setenforce 0" do
   command "setenforce 0"
   ignore_failure true
   returns [ 1, 0 ]
   action :run
end


# stop some services
node[:base][:services][:centos].each do |svc|
  service svc do 
    action [ :stop, :disable]
  end
end