class UserAgent
  attr_accessor :user_agent, :device, :os, :browser
  
  def initialize(user_agent_str)
    @user_agent = user_agent_str
  end
  
  alias_method :operating_system, :os
end