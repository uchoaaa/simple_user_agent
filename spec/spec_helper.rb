# encoding: utf-8
require 'mocha/api'
require 'mocha-on-bacon'
require 'bacon'
require 'turbo_user_agent_parser'
require 'ruby-debug'

def today_is( fake_day )
  today = fake_day.is_a?(String) ? Date.parse(fake_day) : fake_day
  Date.stubs(:today).returns(today)
end

Bacon.summary_on_exit
