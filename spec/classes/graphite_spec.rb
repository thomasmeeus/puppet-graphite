#!/usr/bin/env rspec

require 'spec_helper'

describe 'graphite' do

  let (:facts) { {:timezone => 'CET', :operatingsystem => 'Centos'} }
  let (:pre_condition) {"class concat::setup {}" "define concat($path = $name, $owner = 'root', $group = 'root', $mode = '0644', $warn = false, $force = false, $backup = 'puppet', $replace = true, $gnu = undef, $order = 'alpha') {}" "define concat::fragment($target, $content = '', $source = '', $order = 10, $ensure = 'present', $mode = '0644', $owner = 'root', $group = 'root', $backup = 'puppet') {}" }
  
  it { should contain_class 'graphite' }

  it { should include_class('graphite::whisper') }
  it { should include_class('graphite::carbon') }
  it { should include_class('graphite::web') }

end
