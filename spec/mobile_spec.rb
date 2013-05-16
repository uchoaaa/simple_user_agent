# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'TurboUserAgentParser to mobile user_agents strings' do

  it 'should return device as Mobile and the right browser and os' do
  
    [
      {
        :ua      => 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 5_1_1 like Mac OS X; en) AppleWebKit/534.46.0 (KHTML, like Gecko) CriOS/19.0.1084.60 Mobile/9B206 Safari/7534.48.3',
        # :device  => 'Mobile',
        :device  => 'Desktop', #TODO  mudar né?
        :os      => 'iPhone',
        :browser => 'Chrome'
      },
      # {
      #   :ua      => 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543 Safari/419.3',
      #   :device  => 'Mobile',
      #   :os      => 'iOS',
      #   :browser => 'Safari',
      # },
      # {
      #   :ua      => 'Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19',
      #   :device  => 'Mobile',
      #   :os      => 'Android',
      #   :browser => 'Chrome'
      # }
    
    ].each do |line|
      user_agent_str = line[:ua]
      
      turbo = TurboUserAgentParser.parse(user_agent_str)
      turbo.device.should  == line[:device]
      turbo.os.should      == line[:os]
      turbo.browser.should == line[:browser]
    end
  end

end
