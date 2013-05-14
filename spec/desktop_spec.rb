# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'TurboUserAgentParser to desktops user_agents strings' do

  it 'should return device as Desktop, the so as Macintosh and browser as Safari fot this one' do
    user_agent_str = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.53.11 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10'

    turbo = TurboUserAgentParser.parse(user_agent_str)
    turbo.device.should == 'Desktop'
    turbo.os.should == 'Macintosh'
    turbo.browser.should == 'Safari'
  end

end