#!/usr/bin/env rspec

require 'spec_helper'

describe 'graphite' do

  let (:facts) { {:timezone => 'CET', :operatingsystem => 'Centos'} }
  let (:pre_condition) {"class concat::setup {}" "define concat($path = $name, $owner = 'root', $group = 'root', $mode = '0644', $warn = false, $force = false, $backup = 'puppet', $replace = true, $gnu = undef, $order = 'alpha') {}" "define concat::fragment($target, $content = '', $source = '', $order = 10, $ensure = 'present', $mode = '0644', $owner = 'root', $group = 'root', $backup = 'puppet') {}" }

  context 'with default parameters' do
    let (:params) { {} }

    it { should contain_class('graphite::carbon') }
    it { should contain_class('graphite::web').with(
      {
        :timezone => 'CET',
        :datadir  => '/var/lib/carbon'
      }
    )}
  end

  context 'with timezone => Europe/Brussels and datadir => /data/carbon' do
    let (:params) { {
      :timezone => 'Europe/Brussels',
      :datadir  => '/data/carbon'
    } }

    it { should contain_class('graphite::carbon') }
    it { should contain_class('graphite::web').with(
      {
        :timezone => 'Europe/Brussels',
        :datadir  => '/data/carbon'
      }
    )}
  end
end
