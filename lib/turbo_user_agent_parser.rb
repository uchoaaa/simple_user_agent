require 'user_agent'

require "turbo_user_agent_parser/version"

module TurboUserAgentParser
  def TurboUserAgentParser.parse(user_agent_str)
    ag = UserAgent.parse(user_agent_str)
  end
end
