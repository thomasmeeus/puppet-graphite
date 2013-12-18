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
      :mode    => '0644'
    )}
    it { should contain_file('local_settings.py').with(
      :content => /^TIME_ZONE = 'CET'$/
    )}
    it { should contain_file('local_settings.py').with(
      :content => /^WHISPER_DIR = '\/var\/lib\/carbon\/whisper'$/
    )}
  end

  context 'with timezone => Europe/Brussels and datadir => /data/carbon' do
    let (:params) { {
      :timezone => 'Europe/Brussels',
      :datadir  => '/data/carbon'
    } }

    it { should contain_file('local_settings.py').with(
      :ensure  => 'file',
      :path    => '/etc/graphite-web/local_settings.py',
      :owner   => 'root',
      :group   => 'root',
      :mode    => '0644'
    )}
    it { should contain_file('local_settings.py').with(
      :content => /^TIME_ZONE = 'Europe\/Brussels'$/
    )}
    it { should contain_file('local_settings.py').with(
      :content => /^WHISPER_DIR = '\/data\/carbon\/whisper'$/
    )}
  end
end
