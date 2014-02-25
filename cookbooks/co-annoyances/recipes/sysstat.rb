#
# Cookbook Name:: co-annoyances
# Recipe:: sysstat
#
# Copyright 2012, CloudOps.com
#
# All rights reserved - Do Not Redistribute
#
if platform?(%w{ redhat centos fedora })
  sysstat_conf = "/etc/sysconfig/sysstat"
elsif platform?(%w{ ubuntu debian })
  sysstat_conf = "/etc/sysstat/sysstat"
end
  
package("sysstat") { action :install }
#service("sysstat") { action :enable }

service("sysstat") do
  action :enable
  ignore_failure true
end

template sysstat_conf do
  source "sysstat.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "sysstat")
end

if platform?(%w{ ubuntu debian })
  template "/etc/default/sysstat" do
    source "ubuntu_default_sysstat.erb"
    owner "root"
    group "root"
    mode 0644
    notifies :restart, resources(:service => "sysstat")
  end
end
  