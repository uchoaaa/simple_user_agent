class UserAgentParser
  include Parsers::OperatingSystem
  include Parsers::Browser
  include Parsers::Device

  def self.parse(user_agent_string)
    UserAgentParser.new(user_agent_string).parse!
  end
  
  MATCHER = %r{
      ^([^/\s]+)        # Product
      /?([^\s]*)        # Version
      (\s\(([^\)]*)\))? # Comment
    }x.freeze
  
  def initialize(user_agent_string)
    @user_agent_string = user_agent_string.to_s
    @user_agent = UserAgent.new(user_agent_string)
  end
  
  def parse!
    @product = @user_agent_string.match(MATCHER).to_a

    identify_operating_system
    identify_browser if @user_agent.browser.nil?
    identify_device  if @user_agent.device.nil?
    
    @user_agent
  end

end