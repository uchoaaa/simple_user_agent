# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'An UserAgent object' do
  before do
    @ua = UserAgentParser.parse('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.53.11 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10')
  end

  it 'should hold the raw user agent string, device, os and browser' do
    @ua.device.should  == :c
    @ua.os.should      == :mac
    @ua.browser.should == :sf
    @ua.user_agent.should == 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.53.11 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10'
  end

  it 'operating_system should be a alias to os' do
    @ua.operating_system.should == @ua.os
    @ua.operating_system.should == :mac
  end

end