#
# Cookbook:: cb_speedtest-cli
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'my_yum_epel::default'

# clean up from previous locations - we don't use pip
# anymore and don't need this
file '/etc/cron.weekly/speedtest-cli.sh' do
  action :delete
end
file '/etc/cron.monthly/speedtest-cli.sh' do
  action :delete
end

package 'python2-speedtest-cli' do
  action :upgrade
end
