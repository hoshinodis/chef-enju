#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "postgresql-server" do
  action :install
end

dataDir = "/var/lib/psql/data/"
if not File.exists? dataDir then
  execute "postgresql-init" do
    command "sudo service postgresql initdb"
  end
end

service "postgresql" do
  action :start
end
