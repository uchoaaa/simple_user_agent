# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'TurboUserAgentParser to desktops user_agents strings' do

  it 'should be Desktop, Mac OS and Safari' do
    user_agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.53.11 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10'
    should_be 'Desktop', 'Mac OS', 'Safari'
  end

  it 'should be Desktop, Mac OS and Chrome' do
    user_agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.151 Safari/535.19'
    should_be 'Desktop', 'Mac OS', 'Chrome'
  end 

  it 'should be Desktop, Windows and Chrome' do
    user_agent 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.19 (KHTML, like Gecko) Chrome/1.0.154.53 Safari/525.19'
    should_be 'Desktop', 'Windows', 'Chrome'
  end 

  it 'should be Desktop, Windows and Safari' do
    user_agent 'Mozilla/5.0 (Windows; U; Windows NT 6.1; tr-TR) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27'
    should_be 'Desktop', 'Windows', 'Safari'
  end 

  it 'should be Desktop, Windows and Firefox' do
    user_agent 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20130406 Firefox/23.0'
    should_be 'Desktop', 'Windows', 'Firefox'

    user_agent 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:22.0) Gecko/20130328 Firefox/22.0'
    should_be 'Desktop', 'Windows', 'Firefox'

    user_agent 'Mozilla/5.0 (Windows NT x.y; rv:10.0) Gecko/20100101 Firefox/10.0'
    should_be 'Desktop', 'Windows', 'Firefox'
  end 

  it 'should be Desktop, Mac OS and Firefox' do
    user_agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X x.y; rv:10.0) Gecko/20100101 Firefox/10.0'
    should_be 'Desktop', 'Mac OS', 'Firefox'

    user_agent 'Mozilla/5.0 (Macintosh; PPC Mac OS X x.y; rv:10.0) Gecko/20100101 Firefox/10.0'
    should_be 'Desktop', 'Mac OS', 'Firefox'
  end

  it 'should be Desktop, Linux and Firefox' do
    user_agent 'Mozilla/5.0 (X11; Linux i686; rv:10.0) Gecko/20100101 Firefox/10.0'
    should_be 'Desktop', 'Linux', 'Firefox'

    user_agent 'Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20100101 Firefox/10.0'
    should_be 'Desktop', 'Linux', 'Firefox'

    user_agent 'Mozilla/5.0 (X11; Linux i686 on x86_64; rv:10.0) Gecko/20100101 Firefox/10.0'
    should_be 'Desktop', 'Linux', 'Firefox'

    user_agent 'Mozilla/5.0 (Maemo; Linux armv7l; rv:10.0) Gecko/20100101 Firefox/10.0 Fennec/10.0'
    should_be 'Desktop', 'Linux', 'Firefox'
  end

  it 'should be Desktop, Windows and IE' do
    user_agent 'Mozilla/5.0 (Windows; U; MSIE 9.0; Windows NT 9.0; en-US)'
    should_be 'Desktop', 'Windows', 'Internet Explorer'
    
    user_agent 'Mozilla/4.0 (compatible; MSIE 6.1; Windows XP)'
    should_be 'Desktop', 'Windows', 'Internet Explorer'
    
    user_agent 'Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.1; SLCC1; .NET CLR 1.1.4322)'
    should_be 'Desktop', 'Windows', 'Internet Explorer'
    
    user_agent 'Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; en-US))'
    should_be 'Desktop', 'Windows', 'Internet Explorer'
    
    user_agent 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/4.0; InfoPath.2; SV1; .NET CLR 2.0.50727; WOW64)'
    should_be 'Desktop', 'Windows', 'Internet Explorer'
    
    user_agent 'Mozilla/5.0 (compatible; MSIE 10.6; Windows NT 6.1; Trident/5.0; InfoPath.2; SLCC1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 2.0.50727) 3gpp-gba UNTRUSTED/1.0'
    should_be 'Desktop', 'Windows', 'Internet Explorer'
  end

end