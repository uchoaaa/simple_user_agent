# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'TurboUserAgentParser to desktops user_agents strings' do

  it 'should be Desktop, Mac OS and Safari' do
    user_agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.53.11 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10'
    should_be 'Desktop', 'Mac OS', 'Safari'
  end

  it 'shoud be Desktop, Mac OS and Chrome' do
    user_agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.151 Safari/535.19'
    should_be 'Desktop', 'Mac OS', 'Chrome'
  end 

  it 'shoud be Desktop, Windows and Chrome' do
    user_agent 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.19 (KHTML, like Gecko) Chrome/1.0.154.53 Safari/525.19'
    should_be 'Desktop', 'Windows', 'Chrome'
  end 

end