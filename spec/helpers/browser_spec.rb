# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'UserAgentHelper' do
  describe 'browsers name' do

    # BROWSER
    # :sf => 'Safari'
    # :ch => 'Chrome'
    # :ff => 'Firefox'
    # :ie => 'Internet Explorer'
    # :oth => 'Other'

    it 'should return "Safari" to key :sf' do
      UserAgentHelper.browser_name(:sf).should  == 'Safari'
      UserAgentHelper.browser_name('sf').should == 'Safari'
    end

    it 'should return "Chrome" to key :ch' do
      UserAgentHelper.browser_name(:ch).should  == 'Chrome'
      UserAgentHelper.browser_name('ch').should == 'Chrome'
    end
    # 
    # it 'should return "Mobile" to key :m' do
    #   UserAgentHelper.browser_name(:m).should  == 'Mobile'
    #   UserAgentHelper.browser_name('m').should == 'Mobile'
    # end
    # 
    # it 'should return "Other" to key :oth' do
    #   UserAgentHelper.browser_name(:oth).should  == 'Other'
    #   UserAgentHelper.browser_name('oth').should == 'Other'
    # end
    # 
    # it 'should return "Other" to any other key' do
    #   UserAgentHelper.browser_name(:wrong).should  == 'Other'
    #   UserAgentHelper.browser_name('other thing').should  == 'Other'
    #   UserAgentHelper.browser_name(nil).should  == 'Other'
    # end
    # 
    # it 'should raise exeception if there is no param' do
    #   lambda {
    #     UserAgentHelper.browser_name
    # 
    #   }.should.raise Exception
    # end  
  end
end