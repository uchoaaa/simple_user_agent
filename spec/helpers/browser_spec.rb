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
    
    it 'should return "Firefox" to key :ff' do
      UserAgentHelper.browser_name(:ff).should  == 'Firefox'
      UserAgentHelper.browser_name('ff').should == 'Firefox'
    end
    
    it 'should return "Internet Explorer" to key :ie' do
      UserAgentHelper.browser_name(:ie).should  == 'Internet Explorer'
      UserAgentHelper.browser_name('ie').should == 'Internet Explorer'
    end
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