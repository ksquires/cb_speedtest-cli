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

    # it 'includes pip recipe' do
    # expect(chef_run).to include_recipe('pip::install_pip')
    # end

    it 'creates a file' do
      expect(chef_run).to render_file('/etc/cron.monthly/speedtest-cli.sh').with_content(/pip install speedtest-cli --upgrade/)
    end
  end
end
