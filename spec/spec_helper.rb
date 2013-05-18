# encoding: utf-8
require 'mocha/api'
require 'mocha-on-bacon'
require 'bacon'
require 'simple_user_agent'
require 'ruby-debug'

def today_is( fake_day )
  today = fake_day.is_a?(String) ? Date.parse(fake_day) : fake_day
  Date.stubs(:today).returns(today)
end

def user_agent(user_agent_str)
  @ua = UserAgentParser.parse(user_agent_str)
end

def should_be(device, os, browser)
  @ua.device.should  == device
  @ua.os.should      == os
  @ua.browser.should == browser
end

Bacon.summary_on_exit
