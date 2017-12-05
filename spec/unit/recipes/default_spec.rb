#
# Cookbook:: cb_speedtest-cli
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'cb_speedtest-cli::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.3.1611')
      runner.converge(described_recipe)
    end
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'upgrades a package' do
      expect(chef_run).to upgrade_package('python2-speedtest-cli')
    end
  end
end
