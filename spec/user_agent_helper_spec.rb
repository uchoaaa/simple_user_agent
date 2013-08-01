# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'UserAgentHelper' do
  describe 'devices name' do
    # DEVICES
    # :c => 'Computer'
    # :t => 'Tablet'
    # :m => 'Mobile'
    # :oth => 'Other'

    it 'should return "Computer" to key :c' do
      UserAgentHelper.device_name(:c).should == 'Computer'
      UserAgentHelper.device_name('c').should == 'Computer'
    end

    # it 'should return "Tablet" to key :t'
    # it 'should return "Mobile" to key :m'
    # it 'should return "Other" to key :oth'
  end
end