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
    
    identify_os
    identify_browser 
    identify_device if @device.nil?
  end
  
  def identify_os
    if @partes.first =~ /iPhone/
      @os = 'iPhone'
      @device = 'Mobile'

    elsif @partes.first =~ /Android/
      @os = 'Android'

    end
  end
  
  def identify_device
    
  end
  
  def identify_browser
    if @os == 'iPhone' and @user_agent.to_s =~ /CriOS\/[.0-9]*/
      @browser = 'Chrome'

    elsif @os == 'Android'

      # https://developers.google.com/chrome/mobile/docs/user-agent
      if @user_agent.to_s =~ /Chrome\/[.0-9]*/  
        @browser = 'Chrome'
        @device  = 'Tablet'
      elsif @user_agent.to_s =~ /Chrome\/[.0-9]* Mobile/
        @browser = 'Chrome'
        @device  = 'Mobile'
      end

    end
  end
end