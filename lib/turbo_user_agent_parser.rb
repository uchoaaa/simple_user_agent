require 'user_agent'

require 'turbo_user_agent_parser/version'
require 'turbo_user_agent_parser/turbo_user_agent'

module TurboUserAgentParser
  def TurboUserAgentParser.parse(user_agent_str)
    ag = UserAgent.parse(user_agent_str)
    TurboUserAgent.new(ag)
  end
end
