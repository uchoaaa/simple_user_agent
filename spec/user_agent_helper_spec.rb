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
      UserAgentHelper.device_name(:c).should  == 'Computer'
      UserAgentHelper.device_name('c').should == 'Computer'
    end

    it 'should return "Tablet" to key :t' do
      UserAgentHelper.device_name(:t).should  == 'Tablet'
      UserAgentHelper.device_name('t').should == 'Tablet'
    end

    it 'should return "Mobile" to key :m' do
      UserAgentHelper.device_name(:m).should  == 'Mobile'
      UserAgentHelper.device_name('m').should == 'Mobile'
    end

    it 'should return "Other" to key :oth' do
      UserAgentHelper.device_name(:oth).should  == 'Other'
      UserAgentHelper.device_name('oth').should == 'Other'
    end

    it 'should return "Other" to any other key' do
      UserAgentHelper.device_name(:wrong).should  == 'Other'
      UserAgentHelper.device_name('other thing').should  == 'Other'
      UserAgentHelper.device_name(nil).should  == 'Other'
    end

    # it 'should raise exeception if there is no param'
      # UserAgentHelper.device_name.should == nil
  end
end