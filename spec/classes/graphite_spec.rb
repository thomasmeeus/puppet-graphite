#!/usr/bin/env rspec

require 'spec_helper'

describe 'graphite' do
  it { should contain_class 'graphite' }
end
