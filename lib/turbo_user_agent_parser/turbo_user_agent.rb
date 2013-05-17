
# Helpful links:
# https://developer.mozilla.org/en-US/docs/Browser_detection_using_the_user_agent
# https://developers.google.com/chrome/mobile/docs/user-agent
# http://developer.apple.com/library/safari/#documentation/appleapplications/reference/safariwebcontent/OptimizingforSafarioniPhone/OptimizingforSafarioniPhone.html

# TODO:
# Trocar Desktop por Computer
# I18n? Computer, ordenador, computador..
# Add UA de App como agregadores (Flipboard), Google Reader, etc
# Add UA de crawlers (google, bing, facebook, etc) #acho que não precisa pq essa chamada para identificar vem via JS
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

    elsif @partes.first =~ /Mac\ OS/ and not @user_agent.to_s =~ /Mobile/
      @os = 'Mac OS'
      @device = 'Desktop'

    elsif @partes.first =~ /Windows/
      @os = 'Windows'
      @device = 'Desktop'

    elsif @partes.first =~ /Linux/
      @os = 'Linux'
      @device = 'Desktop'
      
    elsif @user_agent.to_s =~ /Mobile/
      @os = 'Other'
      @device = 'Mobile'
      @browser = 'Other'
      
    else
      @os = 'Other'
      @device = 'Other'
      @browser = 'Other'

    end
  end
  
  def identify_browser
    if @os == 'iPhone'

      if @user_agent.to_s =~ /CriOS\/[.0-9]*/
        @browser = 'Chrome'
      elsif @user_agent.to_s =~ /Safari\/[.0-9]*/
        @browser = 'Safari'
      else
        @browser = 'Other'
      end

    elsif @os == 'Android'

      # https://developers.google.com/chrome/mobile/docs/user-agent
      if @user_agent.to_s =~ /Chrome\/[.0-9]* Mobile/ 
        @browser = 'Chrome'
        @device  = 'Mobile'
      elsif @user_agent.to_s =~ /Chrome\/[.0-9]*/ 
        @device  = 'Tablet'
        @browser = 'Chrome'
      elsif @user_agent.to_s =~ /Firefox\/[.0-9]*/ and @user_agent.to_s =~ /Tablet/ 
        @device  = 'Tablet'
        @browser = 'Firefox'
      end
      
    elsif @os == 'iPad'

      if @user_agent.to_s =~ /Safari\/[.0-9]*/ and not @user_agent.to_s =~ /Chrome\/[.0-9]*/
        @browser = 'Safari'
      end
      
    elsif @device == 'Desktop'

      if @user_agent.to_s =~ /Safari\/[.0-9]*/ and not @user_agent.to_s =~ /Chrome\/[.0-9]*/  #atenção ao NOT
        @browser = 'Safari'
      elsif @user_agent.to_s =~ /Safari\/[.0-9]*/ and @user_agent.to_s =~ /Chrome\/[.0-9]*/
        @browser = 'Chrome'
      elsif @user_agent.to_s =~ /Firefox\/[.0-9]*/ and not @user_agent.to_s =~ /Seamonkey\/[.0-9]*/
        @browser = 'Firefox'
      elsif @user_agent.to_s =~ /MSIE [.0-9]*/
        @browser = 'Internet Explorer'
      end

    end
  end
end