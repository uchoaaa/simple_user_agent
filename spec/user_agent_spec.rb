# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'UserAgent object' do
  it 'should hold the raw user agent string, device, os and browser' do
    user_agent_str = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.53.11 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10'
    
    @ua = UserAgentParser.parse(user_agent_str)
    @ua.device.should  == :c
    @ua.os.should      == :mac
    @ua.browser.should == :sf
    @ua.user_agent.should == user_agent_str
  end
end