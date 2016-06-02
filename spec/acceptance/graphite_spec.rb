require 'spec_helper_acceptance'

describe 'graphite' do

  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        include stdlib
        include stdlib::stages
        include profile::package_management

        class { 'cegekarepos' : stage => 'setup_repo' }
        
        Yum::Repo <| title == 'epel' |>

        include graphite
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe service('carbon-cache') do
      it { should be_enabled }
    end
    describe service('carbon-cache') do
      it { should be_running }
    end
  end
end
