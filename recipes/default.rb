#
# Cookbook:: cb_speedtest-cli
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'pip::default'

cookbook_file '/etc/cron.weekly/speedtest-cli.sh' do
  source 'speedtest-cli.sh'
  owner 'root'
  group 'root'
  mode '0740'
  action :create
end

execute 'install_speedtest-cli' do
  command '/etc/cron.weekly/speedtest-cli.sh'
end
