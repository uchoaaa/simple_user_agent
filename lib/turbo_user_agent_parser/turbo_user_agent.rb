
# Helpful links:
# http://msdn.microsoft.com/en-us/library/ie/hh920767(v=vs.85).aspx
# https://developer.mozilla.org/en-US/docs/Browser_detection_using_the_user_agent
# https://developers.google.com/chrome/mobile/docs/user-agent
# http://developer.apple.com/library/safari/#documentation/appleapplications/reference/safariwebcontent/OptimizingforSafarioniPhone/OptimizingforSafarioniPhone.html
# http://supportforums.blackberry.com/t5/Web-and-WebWorks-Development/How-to-detect-the-BlackBerry-Browser/ta-p/559862
# http://www.developer.nokia.com/Community/Wiki/User-Agent_headers_for_Nokia_devices

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
    identify_device if @device.nil?
  end
  
  def identify_os
    if @partes.first =~ /iPad/
      @os = 'iPad'
      @device = 'Tablet'

    elsif @partes.first =~ /iPhone/
      @os = 'iPhone'
      @device = 'Mobile'

    elsif @partes.first =~ /Android/
      @os = 'Android'

    elsif @partes.first =~ /Mac\ OS/ and not @user_agent.to_s =~ /Mobile/
      @os = 'Mac OS'
      @device = 'Desktop'

    elsif @partes.first =~ /Windows/ and not @user_agent.to_s =~ /Windows\ Phone/  and not @user_agent.to_s =~ /Touch/ 
      @os = 'Windows'
      @device = 'Desktop'

    elsif @user_agent.to_s =~ /Windows\ Phone/ 
      @os = 'Windows Phone'
      @device = 'Mobile'

    elsif @user_agent.to_s =~ /Windows/ and @user_agent.to_s =~ /Touch/
      @os = 'Windows'
      @device = 'Tablet'
      @browser = 'Internet Explorer'

    elsif @user_agent.to_s =~ /PlayBook/
      @os = 'Blackberry'
      @device = 'Tablet'
      @browser = 'Other'

    elsif @partes.first =~ /Linux|FreeBSD|Ubuntu/
      @os = 'Linux'
      @device = 'Desktop'

    elsif @partes.first =~ /BB10/
      @os = 'Blackberry'
      @device = 'Mobile'
      @browser = 'Other'

    elsif @user_agent.to_s =~ /Mobile/ or @partes.first =~ /SymbOS|SymbianOS|webOS/
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
      elsif @user_agent.to_s =~ /Firefox\/[.0-9]*/ and @user_agent.to_s =~ /Mobile/ 
        @device  = 'Mobile'
        @browser = 'Firefox'
      elsif @user_agent.to_s =~ /Opera\ Mobi/
        @device  = 'Mobile'
        @browser = 'Other'
      else
        # @device  = 'Mobile' #pode ser tbm tablet!
        @browser = 'Other'
      end
      
    elsif @os == 'iPad'

      if @user_agent.to_s =~ /Safari\/[.0-9]*/ and not @user_agent.to_s =~ /CriOS\/[.0-9]*/
        @browser = 'Safari'
      elsif @user_agent.to_s =~ /CriOS\/[.0-9]*/
        @browser = 'Chrome'
      else
        @browser = 'Other'
      end
      
    elsif @device == 'Desktop'

      if @user_agent.to_s =~ /Safari\/[.0-9]*/ and not @user_agent.to_s =~ /Chrome\/[.0-9]*/  #atenção ao NOT
        @browser = 'Safari'
      elsif @user_agent.to_s =~ /Safari\/[.0-9]*/ and @user_agent.to_s =~ /Chrome\/[.0-9]*/ and not @user_agent.to_s =~ /RockMelt/
        @browser = 'Chrome'
      elsif @user_agent.to_s =~ /Firefox\/[.0-9]*/ and not @user_agent.to_s =~ /Seamonkey\/[.0-9]*/ and not @user_agent.to_s =~ /Opera/
        @browser = 'Firefox'
      elsif @user_agent.to_s =~ /MSIE [.0-9]*/ and not @user_agent.to_s =~ /Opera/
        @browser = 'Internet Explorer'
      else
        @browser = 'Other'
      end
      
    elsif @os == 'Windows Phone'

      if @user_agent.to_s =~ /IEMobile\/[.0-9]*/
        @browser = 'Internet Explorer'
      else
        @browser = 'Other'
      end
      
    end
  end

  def identify_device
    if @os == 'Android'
      
      if @user_agent.to_s =~ /Mobile/ 
        @device = 'Mobile'
      elsif @user_agent.to_s =~ /Tablet/ 
        @device = 'Tablet'
      else
        @device = 'Tablet' #Google Nexus. Ver link acima.
      end
      
    else
      @device = 'Other'
    end
  end
end