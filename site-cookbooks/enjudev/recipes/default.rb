#
# Cookbook Name:: enjudev
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#memcached
package "memcached" do
  action :install
end

%w{ImageMagick ImageMagic-devel libjpeg-devel libpng-devel}.each do |pkg|
  package pkg do
    action :install
  end
end

gem_package "bundler" do
  action :install
end

#インスコ先
directory "/home/vagrant/app" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
end

#githubからおとす
git "/home/vagrant/app/enju_trunk" do
  repository "https://github.com/MiraitSystems/enju_trunk.git"
  revision "master"
  action :checkout
  user "vagrant"
  group "vagrant"
end

#ついでにbundle install
script "bundle install" do
  interpreter "bash"
  cwd "/home/vagrant/app/enju_trunk"
  user "vagrant"
  code << EOS
    bundle install
  EOS
end

