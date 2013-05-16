class TurboUserAgent
  attr_reader :user_agent
  
  # https://github.com/josh/useragent
  def initialize(user_agent)
    @user_agent = user_agent
  end
  
  def device
    if @user_agent.mobile? #https://github.com/josh/useragent/blob/ba32677e095f86449cb7fbb378fd2a2ce66fd168/lib/user_agent/browsers/all.rb
      if @user_agent.to_s.match(/Mobile/) #https://developers.google.com/chrome/mobile/docs/user-agent
        'Mobile'
      else
        'Tablet'
      end
    else
      'Desktop'
    end
  end
  
  def os
    if @user_agent.mobile? and @user_agent.platform == 'Linux'
      'Android'
    else
      @user_agent.platform
    end
  end
  
  def browser
    if @user_agent.platform == 'iPhone' and @user_agent.to_s.match(/CriOS\//)
      #'Mozilla/5.0 (iPhone; U; CPU iPhone OS 5_1_1 like Mac OS X; en) AppleWebKit/534.46.0 (KHTML, like Gecko) CriOS/19.0.1084.60 Mobile/9B206 Safari/7534.48.3'
      # https://developers.google.com/chrome/mobile/docs/user-agent

      'Chrome'
    else
      @user_agent.browser
    end
  end
  
end