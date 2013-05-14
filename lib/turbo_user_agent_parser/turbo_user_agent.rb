class TurboUserAgent
  # https://github.com/josh/useragent
  def initialize(user_agent)
    @user_agent = user_agent
  end
  
  def device
    'Desktop'
  end
  
  def os
    @user_agent.platform
  end
  
  def browser
    @user_agent.browser
  end
  
end