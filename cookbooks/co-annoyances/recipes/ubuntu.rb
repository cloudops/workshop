#
# Cookbook Name:: co-annoyances
# Recipe:: ubuntu
#
# Copyright 2012, CloudOps.com
#
# All rights reserved - Do Not Redistribute
#
node[:base][:missing_pkg][:ubuntu].each do |pkg|
  package(pkg) {action :install}
end

package("nano") {action :purge}

#turn off apparmor
service("apparmor") { action [:stop,:disable] }

#turn off byobu
file("/etc/profile.d/Z98-byobu") { action :delete }

#turn off whoopsie (Ubuntu crash database submission daemon)
service("whoopsie") do
  action [:stop,:disable]
  ignore_failure true
end

package("whoopsie") { action :purge }

# if this is ever on a server...
package("unity-lens-shopping") { action :purge }

# Disable xe-automator service
# It could break network interfaces configuration (for interface different than eth0)
file "/etc/init/xe-automator.conf" do
  action :delete
  backup false
  only_if { ::File.exists?("/etc/init/xe-automator.conf") }
end
