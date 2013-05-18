module Parsers
  module OperatingSystem

    def identify_operating_system
      if @product.first =~ /iPad/
        @user_agent.os = 'iPad'
        @user_agent.device = 'Tablet'

      elsif @product.first =~ /iPhone/
        @user_agent.os = 'iPhone'
        @user_agent.device = 'Mobile'

      elsif @product.first =~ /Android/
        @user_agent.os = 'Android'

      elsif @product.first =~ /Mac\ OS/ and not @user_agent_string =~ /Mobile/
        @user_agent.os = 'Mac OS'
        @user_agent.device = 'Desktop'

      elsif @product.first =~ /Windows/ and not @user_agent_string =~ /Windows\ Phone/  and not @user_agent_string =~ /Touch/ 
        @user_agent.os = 'Windows'
        @user_agent.device = 'Desktop'

      elsif @user_agent_string =~ /Windows\ Phone/ 
        @user_agent.os = 'Windows Phone'
        @user_agent.device = 'Mobile'

      elsif @user_agent_string =~ /Windows/ and @user_agent_string =~ /Touch/
        @user_agent.os = 'Windows'
        @user_agent.device = 'Tablet'
        @user_agent.browser = 'Internet Explorer'

      elsif @user_agent_string =~ /PlayBook/
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

      elsif @user_agent_string =~ /Mobile/ or @product.first =~ /SymbOS|SymbianOS|webOS/
        @user_agent.os = 'Other'
        @user_agent.device = 'Mobile'
        @user_agent.browser = 'Other'

      else
        @user_agent.os = 'Other'
        @user_agent.device = 'Other'
        @user_agent.browser = 'Other'

      end
    end
  
  
  end
end