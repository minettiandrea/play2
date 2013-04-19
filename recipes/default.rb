#
# Cookbook Name:: play2
# Recipe:: default
#
# Copyright 2013, Andrea Minetti
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

require 'fileutils'

include_recipe "java"

# 
# user "root"
# cwd "#{node[:play2][:path][:base]}/framework"
# code "./build clean publish-local"
# code "chown vagrant -R #{node[:play2][:path][:base]}"
# action :nothing

package "unzip" do
  action :install
end

remote_file "#{node[:play2][:path][:prefix]}/play-#{node[:play2][:version]}.zip" do
  source "http://downloads.typesafe.com/play/#{node[:play2][:version]}/play-#{node[:play2][:version]}.zip"
  action :create_if_missing
end

# bash "install play" do
#   user "root"
#   cwd node[:play2][:path][:prefix]
#   code <<-EOH
#     unzip play2.zip
#   EOH
# end

execute "extract" do
  user "root"
  command "unzip play-#{node[:play2][:version]}.zip"
  cwd "#{node[:play2][:path][:prefix]}"
  not_if do
    File.exists?("#{node[:play2][:path][:prefix]}/play-#{node[:play2][:version]}")
  end
end

template "/etc/profile.d/play.sh" do
  source "profile.d.play.erb"
  owner "root"
  group "root"
  mode 0755
  variables(:play_dir => "#{node[:play2][:path][:prefix]}/play-#{node[:play2][:version]}")
end

