module Parsers
  module Browser
    
    def identify_browser
      if @user_agent.os == 'iPhone'

        if @user_agent_string =~ /CriOS\/[.0-9]*/
          @user_agent.browser = 'Chrome'
        elsif @user_agent_string =~ /Safari\/[.0-9]*/
          @user_agent.browser = 'Safari'
        else
          @user_agent.browser = 'Other'
        end

      elsif @user_agent.os == 'Android'

        if @user_agent_string =~ /Chrome\/[.0-9]* Mobile/ 
          @user_agent.browser = 'Chrome'
          @user_agent.device  = 'Mobile'
        elsif @user_agent_string =~ /Chrome\/[.0-9]*/ 
          @user_agent.device  = 'Tablet'
          @user_agent.browser = 'Chrome'
        elsif @user_agent_string =~ /Firefox\/[.0-9]*/ and @user_agent_string =~ /Tablet/ 
          @user_agent.device  = 'Tablet'
          @user_agent.browser = 'Firefox'
        elsif @user_agent_string =~ /Firefox\/[.0-9]*/ and @user_agent_string =~ /Mobile/ 
          @user_agent.device  = 'Mobile'
          @user_agent.browser = 'Firefox'
        elsif @user_agent_string =~ /Opera\ Mobi/
          @user_agent.device  = 'Mobile'
          @user_agent.browser = 'Other'
        else
          # @user_agent.device  = 'Mobile' #pode ser tbm tablet!
          @user_agent.browser = 'Other'
        end

      elsif @user_agent.os == 'iPad'

        if @user_agent_string =~ /Safari\/[.0-9]*/ and not @user_agent_string =~ /CriOS\/[.0-9]*/
          @user_agent.browser = 'Safari'
        elsif @user_agent_string =~ /CriOS\/[.0-9]*/
          @user_agent.browser = 'Chrome'
        else
          @user_agent.browser = 'Other'
        end

      elsif @user_agent.device == 'Desktop'

        if @user_agent_string =~ /Safari\/[.0-9]*/ and not @user_agent_string =~ /Chrome\/[.0-9]*/  #atenção ao NOT
          @user_agent.browser = 'Safari'
        elsif @user_agent_string =~ /Safari\/[.0-9]*/ and @user_agent_string =~ /Chrome\/[.0-9]*/ and not @user_agent_string =~ /RockMelt/
          @user_agent.browser = 'Chrome'
        elsif @user_agent_string =~ /Firefox\/[.0-9]*/ and not @user_agent_string =~ /Seamonkey\/[.0-9]*/ and not @user_agent_string =~ /Opera/
          @user_agent.browser = 'Firefox'
        elsif @user_agent_string =~ /MSIE [.0-9]*/ and not @user_agent_string =~ /Opera/
          @user_agent.browser = 'Internet Explorer'
        else
          @user_agent.browser = 'Other'
        end

      elsif @user_agent.os == 'Windows Phone'

        if @user_agent_string =~ /IEMobile\/[.0-9]*/
          @user_agent.browser = 'Internet Explorer'
        else
          @user_agent.browser = 'Other'
        end

      end
    end

  end
end