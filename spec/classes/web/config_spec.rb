#!/usr/bin/env rspec

require 'spec_helper'

describe 'graphite::web::config' do

  let (:facts) { {:timezone => 'CET', :operatingsystem => 'Centos'} }

  context 'with default parameters' do
    let (:params) { {} }

    it { should contain_file('local_settings.py').with(
      :ensure  => 'file',
      :path    => '/etc/graphite-web/local_settings.py',
      :owner   => 'root',
      :group   => 'root',
      :mode    => '0644',
      :content => /^TIME_ZONE = 'CET'$/
    )}
  end

  context 'with timezone => Europe/Brussels' do
    let (:params) { { :timezone => 'Europe/Brussels' } }

    it { should contain_file('local_settings.py').with(
      :ensure  => 'file',
      :path    => '/etc/graphite-web/local_settings.py',
      :owner   => 'root',
      :group   => 'root',
      :mode    => '0644',
      :content => /^TIME_ZONE = 'Europe\/Brussels'$/
    )}
  end
end
