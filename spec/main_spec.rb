require 'spec_helper'

describe "Flussonic VOD setup" do
  package('flussonic') do
    it { should be_installed }
  end

  package('flussonic-ffmpeg') do
    it { should be_installed }
  end

  package('flussonic-python') do
    it { should be_installed }
  end

  describe file('/etc/flussonic') do
    it { should be_directory }
  end

  describe file('/etc/flussonic/licence.txt') do
    it { should be_file }
    its(:content) { should include(ANSIBLE_VARS.fetch('flussonic_licence_key', 'FAIL')) }
  end

  describe file('/etc/flussonic/flussonic.conf') do
    it { should be_file }
    its(:content) { should include("file #{ANSIBLE_VARS.fetch('flussonic_vod_path', 'FAIL')} {") }
    its(:content) { should include("path s3://#{ANSIBLE_VARS.fetch('flussonic_bucket_aws_access_key', 'FAIL')}:#{ANSIBLE_VARS.fetch('flussonic_bucket_aws_secret_key')}@s3.amazonaws.com/#{ANSIBLE_VARS.fetch('flussonic_bucket_name', 'FAIL')};") }
  end

end
