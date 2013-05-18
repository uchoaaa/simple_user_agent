module Parsers
  module Browser
    
    def identify_browser
      if @user_agent.os == :iph

        if @user_agent_string =~ /CriOS\/[.0-9]*/
          @user_agent.browser = :ch
        elsif @user_agent_string =~ /Safari\/[.0-9]*/
          @user_agent.browser = :sf
        else
          @user_agent.browser = :oth
        end

      elsif @user_agent.os == :adr

        if @user_agent_string =~ /Chrome\/[.0-9]* Mobile/ 
          @user_agent.browser = :ch
          @user_agent.device  = :m
        elsif @user_agent_string =~ /Chrome\/[.0-9]*/ 
          @user_agent.device  = :t
          @user_agent.browser = :ch
        elsif @user_agent_string =~ /Firefox\/[.0-9]*/ and @user_agent_string =~ /Tablet/ 
          @user_agent.device  = :t
          @user_agent.browser = :ff
        elsif @user_agent_string =~ /Firefox\/[.0-9]*/ and @user_agent_string =~ /Mobile/ 
          @user_agent.device  = :m
          @user_agent.browser = :ff
        elsif @user_agent_string =~ /Opera\ Mobi/
          @user_agent.device  = :m
          @user_agent.browser = :oth
        else
          # @user_agent.device  = :m #pode ser tbm tablet!
          @user_agent.browser = :oth
        end

      elsif @user_agent.os == :ipa

        if @user_agent_string =~ /Safari\/[.0-9]*/ and not @user_agent_string =~ /CriOS\/[.0-9]*/
          @user_agent.browser = :sf
        elsif @user_agent_string =~ /CriOS\/[.0-9]*/
          @user_agent.browser = :ch
        else
          @user_agent.browser = :oth
        end

      elsif @user_agent.device == :c

        if @user_agent_string =~ /Safari\/[.0-9]*/ and not @user_agent_string =~ /Chrome\/[.0-9]*/  #atenção ao NOT
          @user_agent.browser = :sf
        elsif @user_agent_string =~ /Safari\/[.0-9]*/ and @user_agent_string =~ /Chrome\/[.0-9]*/ and not @user_agent_string =~ /RockMelt/
          @user_agent.browser = :ch
        elsif @user_agent_string =~ /Firefox\/[.0-9]*/ and not @user_agent_string =~ /Seamonkey\/[.0-9]*/ and not @user_agent_string =~ /Opera/
          @user_agent.browser = :ff
        elsif @user_agent_string =~ /MSIE [.0-9]*/ and not @user_agent_string =~ /Opera/
          @user_agent.browser = :ie
        else
          @user_agent.browser = :oth
        end

      elsif @user_agent.os == :wip

        if @user_agent_string =~ /IEMobile\/[.0-9]*/
          @user_agent.browser = :ie
        else
          @user_agent.browser = :oth
        end

      end
    end

  end
end