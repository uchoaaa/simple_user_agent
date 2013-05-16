# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'TurboUserAgentParser to Tablet user_agents strings' do

  it 'should be Android and Chrome' do
    user_agent_str = 'Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Safari/535.19'

    turbo = TurboUserAgentParser.parse(user_agent_str)
    turbo.device.should  == 'Tablet'
    turbo.os.should      == 'Android'
    turbo.browser.should == 'Chrome'
  end

end
