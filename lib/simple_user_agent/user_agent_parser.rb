class UserAgentParser
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

    #TODO jogar cada lógica dessa para uma classe própria
    identify_os
    identify_browser if @user_agent.browser.nil?
    identify_device  if @user_agent.device.nil?
    
    @user_agent
  end

  def identify_os
    if @product.first =~ /iPad/
      @user_agent.os = 'iPad'
      @user_agent.device = 'Tablet'

    elsif @product.first =~ /iPhone/
      @user_agent.os = 'iPhone'
      @user_agent.device = 'Mobile'

    elsif @product.first =~ /Android/
      @user_agent.os = 'Android'

    elsif @product.first =~ /Mac\ OS/ and not @user_agent.to_s =~ /Mobile/
      @user_agent.os = 'Mac OS'
      @user_agent.device = 'Desktop'

    elsif @product.first =~ /Windows/ and not @user_agent.to_s =~ /Windows\ Phone/  and not @user_agent.to_s =~ /Touch/ 
      @user_agent.os = 'Windows'
      @user_agent.device = 'Desktop'

    elsif @user_agent.to_s =~ /Windows\ Phone/ 
      @user_agent.os = 'Windows Phone'
      @user_agent.device = 'Mobile'

    elsif @user_agent.to_s =~ /Windows/ and @user_agent.to_s =~ /Touch/
      @user_agent.os = 'Windows'
      @user_agent.device = 'Tablet'
      @user_agent.browser = 'Internet Explorer'

    elsif @user_agent.to_s =~ /PlayBook/
      @user_agent.os = 'Blackberry'
      @user_agent.device = 'Tablet'
      @user_agent.browser = 'Other'

    elsif @product.first =~ /Linux|FreeBSD|Ubuntu/
      @user_agent.os = 'Linux'
      @user_agent.device = 'Desktop'

    elsif @product.first =~ /BB10/
      @user_agent.os = 'Blackberry'
      @user_agent.device = 'Mobile'
      @user_agent.browser = 'Other'

    elsif @user_agent.to_s =~ /Mobile/ or @product.first =~ /SymbOS|SymbianOS|webOS/
      @user_agent.os = 'Other'
      @user_agent.device = 'Mobile'
      @user_agent.browser = 'Other'

    else
      @user_agent.os = 'Other'
      @user_agent.device = 'Other'
      @user_agent.browser = 'Other'

    end
  end
  
  def identify_browser
    if @user_agent.os == 'iPhone'

      if @user_agent.to_s =~ /CriOS\/[.0-9]*/
        @user_agent.browser = 'Chrome'
      elsif @user_agent.to_s =~ /Safari\/[.0-9]*/
        @user_agent.browser = 'Safari'
      else
        @user_agent.browser = 'Other'
      end

    elsif @user_agent.os == 'Android'

      if @user_agent.to_s =~ /Chrome\/[.0-9]* Mobile/ 
        @user_agent.browser = 'Chrome'
        @user_agent.device  = 'Mobile'
      elsif @user_agent.to_s =~ /Chrome\/[.0-9]*/ 
        @user_agent.device  = 'Tablet'
        @user_agent.browser = 'Chrome'
      elsif @user_agent.to_s =~ /Firefox\/[.0-9]*/ and @user_agent.to_s =~ /Tablet/ 
        @user_agent.device  = 'Tablet'
        @user_agent.browser = 'Firefox'
      elsif @user_agent.to_s =~ /Firefox\/[.0-9]*/ and @user_agent.to_s =~ /Mobile/ 
        @user_agent.device  = 'Mobile'
        @user_agent.browser = 'Firefox'
      elsif @user_agent.to_s =~ /Opera\ Mobi/
        @user_agent.device  = 'Mobile'
        @user_agent.browser = 'Other'
      else
        # @user_agent.device  = 'Mobile' #pode ser tbm tablet!
        @user_agent.browser = 'Other'
      end
      
    elsif @user_agent.os == 'iPad'

      if @user_agent.to_s =~ /Safari\/[.0-9]*/ and not @user_agent.to_s =~ /CriOS\/[.0-9]*/
        @user_agent.browser = 'Safari'
      elsif @user_agent.to_s =~ /CriOS\/[.0-9]*/
        @user_agent.browser = 'Chrome'
      else
        @user_agent.browser = 'Other'
      end
      
    elsif @user_agent.device == 'Desktop'

      if @user_agent.to_s =~ /Safari\/[.0-9]*/ and not @user_agent.to_s =~ /Chrome\/[.0-9]*/  #atenção ao NOT
        @user_agent.browser = 'Safari'
      elsif @user_agent.to_s =~ /Safari\/[.0-9]*/ and @user_agent.to_s =~ /Chrome\/[.0-9]*/ and not @user_agent.to_s =~ /RockMelt/
        @user_agent.browser = 'Chrome'
      elsif @user_agent.to_s =~ /Firefox\/[.0-9]*/ and not @user_agent.to_s =~ /Seamonkey\/[.0-9]*/ and not @user_agent.to_s =~ /Opera/
        @user_agent.browser = 'Firefox'
      elsif @user_agent.to_s =~ /MSIE [.0-9]*/ and not @user_agent.to_s =~ /Opera/
        @user_agent.browser = 'Internet Explorer'
      else
        @user_agent.browser = 'Other'
      end
      
    elsif @user_agent.os == 'Windows Phone'

      if @user_agent.to_s =~ /IEMobile\/[.0-9]*/
        @user_agent.browser = 'Internet Explorer'
      else
        @user_agent.browser = 'Other'
      end
      
    end
  end

  def identify_device
    if @user_agent.os == 'Android'
      
      if @user_agent.to_s =~ /Mobile/ 
        @user_agent.device = 'Mobile'
      elsif @user_agent.to_s =~ /Tablet/ 
        @user_agent.device = 'Tablet'
      else
        @user_agent.device = 'Tablet' #Google Nexus. Ver link acima.
      end
      
    else
      @user_agent.device = 'Other'
    end
  end

  
  
end