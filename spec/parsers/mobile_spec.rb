# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'UserAgentParser to mobile user_agents strings' do

  it 'should be iPhone and Chrome' do
    user_agent 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 5_1_1 like Mac OS X; en) AppleWebKit/534.46.0 (KHTML, like Gecko) CriOS/19.0.1084.60 Mobile/9B206 Safari/7534.48.3'
    should_be :m, :iph, :ch
  end           

  it 'should be iPhone and Safari' do
    user_agent 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543 Safari/419.3'
    should_be :m, :iph, :sf

    user_agent 'Mozilla/5.0 (iPhone; U; ru; CPU iPhone OS 4_2_1 like Mac OS X; ru) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8C148a Safari/6533.18.5'
    should_be :m, :iph, :sf
  end

  it 'should be iPhone and Other' do
    user_agent 'Opera/9.80 (iPhone; Opera Mini/5.0.0176/764; U; en) Presto/2.4.15' #opera
    should_be :m, :iph, :oth

    user_agent 'UCHOA/9.80 (iPhone; UCHOAS/5.0.0176/764; U; en) Presto/2.4.15'
    should_be :m, :iph, :oth

    user_agent 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 5_1_1 like Mac OS X; en) AppleWebKit/534.46.0 (KHTML, like Gecko) UCHOAS/19.0.1084.60 Mobile/9B206'
    should_be :m, :iph, :oth
  end
  
  it 'should be Android and Chrome' do
    user_agent 'Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19'
    should_be :m, :adr, :ch
  end

  it 'should be Android and Firefox' do
    user_agent 'Mozilla/5.0 (Android; Mobile; rv:13.0) Gecko/13.0 Firefox/13.0'
    should_be :m, :adr, :ff
  end

  it 'should be Android and Other' do
    user_agent 'Opera/9.80 (Android 4.1.1; Opera Mobi/$BUILD_NUMBER) Presto/$PRESTO_VERSION Version/$VERSION'
    should_be :m, :adr, :oth
    
    user_agent 'Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) UCHOAS/18.0.1025.133 Mobile Safari/535.19'
    should_be :m, :adr, :oth
      
    user_agent 'Mozilla/5.0 (Android; Mobile; rv:13.0) Gecko/13.0 UCHOAS/13.0'
    should_be :m, :adr, :oth
  end

  it 'should be Windows Phone and IE' do
    user_agent 'Mozilla/5.0 (compatible; MSIE 9.0; Windows Phone OS 7.5; Trident/5.0; IEMobile/9.0; SAMSUNG; SGH-i917)'
    should_be :m, :wip, :ie

    user_agent 'Mozilla/4.0 (compatible; MSIE 7.0; Windows Phone OS 7.0; Trident/3.1; IEMobile/7.0; LG; GW910)'
    should_be :m, :wip, :ie
    
    user_agent 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)'
    should_be :m, :wip, :ie
    
    user_agent 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 820)'
    should_be :m, :wip, :ie
    
    user_agent 'Mozilla/5.0 (compatible; MSIE 9.0; Windows Phone OS 7.5; Trident/5.0; IEMobile/9.0; NOKIA; Lumia 900)'
    should_be :m, :wip, :ie
    
    user_agent 'Mozilla/5.0 (compatible; MSIE 9.0; Windows Phone OS 7.5; Trident/5.0; IEMobile/9.0; NOKIA; Lumia 800)'
    should_be :m, :wip, :ie
  end

  it 'should be Windows Phone and Other' do
    user_agent 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; OUTRA COISA QQR/10.0; ARM; Touch; NOKIA; Lumia 920)'
    should_be :m, :wip, :oth
  end

  it 'should be Blackberry and Other' do
    user_agent 'Mozilla/5.0 (BB10; Touch) AppleWebKit/537.10+ (KHTML, like Gecko) Version/<BB Version #> Mobile Safari/537.10+'
    should_be :m, :bkb, :oth

    user_agent 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.10+ (KHTML, like Gecko) Version/<BB Version #> Mobile Safari/537.10+'
    should_be :m, :bkb, :oth
  end
  
  it 'should be Other and Other' do
    user_agent 'Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A93 Safari/419.3' #ipod
    should_be :m, :oth, :oth

    user_agent 'Mozilla/5.0 (Mobile; rv:15.0) Gecko/15.0 Firefox/15.0' #firefox OS
    should_be :m, :oth, :oth
    
    user_agent 'Opera/9.80 (S60; SymbOS Opera Mobi/$BUILD_NUMBER) Presto/$PRESTO_VERSION Version/$VERSION' #opera mobi
    should_be :m, :oth, :oth
    
    user_agent 'Mozilla/5.0 (SymbianOS/9.1; U; [en-us]) AppleWebKit/413 (KHTML, like Gecko) Safari/413' #symbian
    should_be :m, :oth, :oth
    
    user_agent 'Mozilla/5.0 (webOS/1.0; U; en-US) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/1.0 Safari/525.27.1 Pre/1.0' #webOS
    should_be :m, :oth, :oth
  end
end
