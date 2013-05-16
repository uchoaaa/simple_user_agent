# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'TurboUserAgentParser to desktops user_agents strings' do

  it 'should return device as Desktop and the right browser and os' do
    
    [
      {
        :ua      => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.53.11 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10',
        :device  => 'Desktop',
        :os      => 'Macintosh', #TODO: Macintosh é muito feio! Trocar para Mac OS
        :browser => 'Safari',
      },
      {
        :ua      => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.53.11 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10', 
        :device  => 'Desktop',
        :os      => 'Macintosh',
        :browser => 'Safari'
      },
      {
        :ua      => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.151 Safari/535.19',
        :device  => 'Desktop',
        :os      => 'Macintosh',
        :browser => 'Chrome',
      },
      {
        :ua      => 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.19 (KHTML, like Gecko) Chrome/1.0.154.53 Safari/525.19',
        :device  => 'Desktop',
        :os      => 'Windows',
        :browser => 'Chrome'
      }
      
    ].each do |line|
      user_agent_str = line[:ua]
    
      turbo = TurboUserAgentParser.parse(user_agent_str)
      turbo.device.should  == line[:device]
      turbo.os.should      == line[:os]
      turbo.browser.should == line[:browser]
    end
  end

end