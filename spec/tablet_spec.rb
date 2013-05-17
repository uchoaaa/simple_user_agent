# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'TurboUserAgentParser to Tablet user_agents strings' do

  it 'should be iPad and Safari' do
    user_agent 'Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B334b Safari/531.21.10'
    should_be 'Tablet', 'iPad', 'Safari'

    user_agent 'Mozilla/5.0(iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10'
    should_be 'Tablet', 'iPad', 'Safari'
  end

  it 'should be iPad and Chrome' do
    user_agent 'Mozilla/5.0 (iPad; U; CPU iPhone OS 5_1_1 like Mac OS X; en) AppleWebKit/534.46.0 (KHTML, like Gecko) CriOS/19.0.1084.60 Mobile/9B206 Safari/7534.48.3'
    should_be 'Tablet', 'iPad', 'Chrome'
  end

  it 'should be iPad and Other' do
    user_agent 'Mozilla/5.0 (iPad; U; CPU iPhone OS 5_1_1 like Mac OS X; en) AppleWebKit/534.46.0 (KHTML, like Gecko) UCHOAS/19.0.1084.60 Mobile/9B206'
    should_be 'Tablet', 'iPad', 'Other'
  end

  it 'should be Android and Firefox' do
    user_agent 'Mozilla/5.0 (Android; Tablet; rv:13.0) Gecko/13.0 Firefox/13.0'
    should_be 'Tablet', 'Android', 'Firefox'
  end

  it 'should be Android and Chrome' do
    user_agent 'Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Safari/535.19'
    should_be 'Tablet', 'Android', 'Chrome'
  end

  # it 'should be Android and Other' do
    # user_agent 'Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) UCHOA/18.0.1025.133 Safari/535.19'
    # should_be 'Tablet', 'Android', 'Other'
    # should_be 'Mobile', 'Android', 'Other'

    # Mozilla/5.0 (Android; Tablet; rv:13.0) Gecko/13.0 UCHOAS/13.0'
  # end

  it 'should be Windows and IE' do
    user_agent 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Win64; x64; Trident/6.0; Touch)'
    should_be 'Tablet', 'Windows', 'Internet Explorer'
  end

  it 'should be Blackberry and Other' do
    user_agent 'Mozilla/5.0 (PlayBook; U; RIM Tablet OS 2.0.0; en-US) AppleWebKit/535.8+ (KHTML, like Gecko) Version/7.2.0.0 Safari/535.8+'
    should_be 'Tablet', 'Blackberry', 'Other'
  end
end
