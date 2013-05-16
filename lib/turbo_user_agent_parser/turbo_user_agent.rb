class TurboUserAgent
  # attr_reader :user_agent # https://github.com/josh/useragent
  attr_reader :user_agent, :device, :os, :browser

  def initialize(user_agent)
    @user_agent = user_agent
    process!
  end
  
  private
  
  def process!
    identify_os
    # process_device!
    # process_browser!
  end
  
  def identify_os
    
  end
end