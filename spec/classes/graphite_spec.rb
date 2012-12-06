#!/usr/bin/env rspec

require 'spec_helper'

describe 'graphite' do
  it { should contain_class 'graphite' }

  it { should include_class('graphite::whisper') }
  it { should include_class('graphite::carbon') }
  it { should include_class('graphite::web') }

end
