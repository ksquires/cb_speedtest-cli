#
# Cookbook:: cb_speedtest-cli
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'pip::default'

# clean up from previous location - we don't
# need to check *every* week
file '/etc/cron.weekly/speedtest-cli.sh' do
  action :delete
end

cookbook_file '/etc/cron.monthly/speedtest-cli.sh' do
  source 'speedtest-cli.sh'
  owner 'root'
  group 'root'
  mode '0740'
  action :create
end

execute 'install_speedtest-cli' do
  command '/usr/bin/pip install speedtest-cli'
  only_if { !File.exist?('/usr/bin/speedtest') }
end
