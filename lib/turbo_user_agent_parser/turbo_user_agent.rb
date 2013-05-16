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
    # identify_device if @device.nil?
  end
  
  def identify_os
    if @partes.first =~ /iPhone/
      @os = 'iPhone'
      @device = 'Mobile'

    elsif @partes.first =~ /Android/
      @os = 'Android'

    elsif @partes.first =~ /iPad/
      @os = 'iPad'
      @device = 'Tablet'

    elsif @partes.first =~ /Mac\ OS/
      @os = 'Mac OS'
      @device = 'Desktop'

    elsif @partes.first =~ /Windows/
      @os = 'Windows'
      @device = 'Desktop'

    end
  end
  
  def identify_browser
    if @os == 'iPhone'

      if @user_agent.to_s =~ /CriOS\/[.0-9]*/
        @browser = 'Chrome'
      else
        @browser = 'Safari'
      end

    elsif @os == 'Android'

      # https://developers.google.com/chrome/mobile/docs/user-agent
      if @user_agent.to_s =~ /Chrome\/[.0-9]* Mobile/ 
        @browser = 'Chrome'
        @device  = 'Mobile'
      elsif @user_agent.to_s =~ /Chrome\/[.0-9]*/ 
        @device  = 'Tablet'
        @browser = 'Chrome'
      end
      
    elsif @os == 'iPad'

      if @user_agent.to_s =~ /Safari\/[.0-9]*/ and not @user_agent.to_s =~ /Chrome\/[.0-9]*/
        @browser = 'Safari'
      # elsif @user_agent.to_s =~ /Safari\/[.0-9]*/ and @user_agent.to_s =~ /Chrome\/[.0-9]*/
      #   @browser = 'Chrome'
      end
      
    elsif @device == 'Desktop'

      if @user_agent.to_s =~ /Safari\/[.0-9]*/ and not @user_agent.to_s =~ /Chrome\/[.0-9]*/
        @browser = 'Safari'
      elsif @user_agent.to_s =~ /Safari\/[.0-9]*/ and @user_agent.to_s =~ /Chrome\/[.0-9]*/
        @browser = 'Chrome'
      end

    end
  end
end