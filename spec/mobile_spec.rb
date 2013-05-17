# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'TurboUserAgentParser to mobile user_agents strings' do

  it 'should be iPhone and Chrome' do
    user_agent 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 5_1_1 like Mac OS X; en) AppleWebKit/534.46.0 (KHTML, like Gecko) CriOS/19.0.1084.60 Mobile/9B206 Safari/7534.48.3'
    should_be 'Mobile', 'iPhone', 'Chrome'
  end           

  it 'should be iPhone and Safari' do
    user_agent 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543 Safari/419.3'
    should_be 'Mobile', 'iPhone', 'Safari'
  end

  it 'should be iPhone and Other' do
    user_agent 'Opera/9.80 (iPhone; Opera Mini/5.0.0176/764; U; en) Presto/2.4.15' #opera
    should_be 'Mobile', 'iPhone', 'Other'
  end
  
  it 'should be Other and Other' do
    user_agent 'Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A93 Safari/419.3' #ipod
    should_be 'Mobile', 'Other', 'Other'

    user_agent 'Mozilla/5.0 (Mobile; rv:15.0) Gecko/15.0 Firefox/15.0' #firefox OS
    should_be 'Mobile', 'Other', 'Other'
  end

  it 'should be Android and Chrome' do
    user_agent 'Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19'
    should_be 'Mobile', 'Android', 'Chrome'
  end

  it 'should be Android and Firefox' do
    user_agent 'Mozilla/5.0 (Android; Mobile; rv:13.0) Gecko/13.0 Firefox/13.0'
    should_be 'Mobile', 'Android', 'Firefox'
  end

  it 'should be Windows Phone and Internet Explorer' do
    user_agent 'Mozilla/5.0 (compatible; MSIE 9.0; Windows Phone OS 7.5; Trident/5.0; IEMobile/9.0; SAMSUNG; SGH-i917)'
    should_be 'Mobile', 'Windows Phone', 'Internet Explorer'

    user_agent 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)'
    should_be 'Mobile', 'Windows Phone', 'Internet Explorer'

    user_agent 'Mozilla/4.0 (compatible; MSIE 7.0; Windows Phone OS 7.0; Trident/3.1; IEMobile/7.0; LG; GW910)'
    should_be 'Mobile', 'Windows Phone', 'Internet Explorer'
  end

  it 'should be Windows Phone and Other' do
    user_agent 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; OUTRA COISA QQR/10.0; ARM; Touch; NOKIA; Lumia 920)'
    should_be 'Mobile', 'Windows Phone', 'Other'
  end
end
