#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
git "/home/vagrant/.rbenv" do
  repository "git://github.com/sstephenson/rbenv.git"
  reference "master"
  action :checkout
  user "vagrant"
  group "vagrant"
end

directory "/home/vagrant/.rbenv/plugins" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
end

template "/etc/profile.d/rbenv.sh" do
  owner "vagrant"
  group "vagrant"
  mode "0644"
end

git "/home/vagrant/.rbenv/plugins/ruby-build" do
  repository "git://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :checkout
  user "vagrant"
  group "vagrant"
end

