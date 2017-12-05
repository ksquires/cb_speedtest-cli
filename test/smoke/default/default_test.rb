# # encoding: utf-8

# Inspec test for recipe cb_speedtest-cli::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/etc/yum.repos.d/epel.repo') do
  it { should exist }
end

describe package('python2-speedtest-cli') do
  it { should be_installed }
end
