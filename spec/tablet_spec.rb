# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'TurboUserAgentParser to tablet user_agents strings' do

  it 'should return device as Tablet and the right browser and os' do
  
    [
      {
        :ua      => 'Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Safari/535.19',
        :device  => 'Tablet',
        :os      => 'Android',
        :browser => 'Chrome'
      },

    ].each do |line|
      user_agent_str = line[:ua]
      
      turbo = TurboUserAgentParser.parse(user_agent_str)
      turbo.device.should  == line[:device]
      turbo.os.should      == line[:os]
      turbo.browser.should == line[:browser]
    end
  end

end
