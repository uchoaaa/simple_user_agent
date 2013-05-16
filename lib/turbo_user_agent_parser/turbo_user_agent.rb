class TurboUserAgent
  attr_reader :user_agent, :device, :os, :browser
  
  MATCHER = %r{
      ^([^/\s]+)        # Product
      /?([^\s]*)        # Version
      (\s\(([^\)]*)\))? # Comment
    }x.freeze

  def initialize(user_agent)
    @user_agent = user_agent
    process!
  end

  private

  def process!
    @partes = @user_agent.to_s.match(MATCHER).to_a
    
    @os      = identify_os
    @device  = identify_device
    @browser = identify_browser 
  end
  
  def identify_os
    if @partes.first =~ /iPhone/
      'iPhone'

    elsif @partes.first =~ /Android/
      'Android'
    end
  end
  
  def identify_device
    'Mobile' if %w{iPhone}.include? @os
  end
  
  def identify_browser
    if @os == 'iPhone' and @user_agent.to_s =~ /CriOS\/[.0-9]*/
      'Chrome'
    
    elsif @os == 'Android' and @user_agent.to_s =~ /Chrome\/[.0-9]*/
      'Chrome'
    end
  end
end