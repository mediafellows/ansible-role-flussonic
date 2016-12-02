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

  describe file('/etc/flussonic/license.txt') do
    it { should be_file }
    its(:content) { should include(ANSIBLE_VARS.fetch('flussonic_licence_key', 'FAIL')) }
  end

  describe file('/etc/flussonic/flussonic.conf') do
    it { should be_file }
    its(:content) { should include("file #{ANSIBLE_VARS.fetch('flussonic_vod_path', 'FAIL')} {") }
  end

  describe file('/etc/flussonic/flussonic.conf') do
    aws_key         = ANSIBLE_VARS.fetch('flussonic_bucket_aws_access_key', 'FAIL')
    aws_secret_key  = ANSIBLE_VARS.fetch('flussonic_bucket_aws_secret_key', 'FAIL')

    ANSIBLE_VARS.fetch('flussonic_source_buckets', ['FAIL']).each do |bucket|
      its(:content) { should include("path s3://#{aws_key}:#{aws_secret_key}@s3.amazonaws.com/#{bucket};") }
    end
  end
end
