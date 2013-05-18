module Parsers
  module OperatingSystem

    def identify_operating_system
      if @product.first =~ /iPad/
        @user_agent.os = :ipa
        @user_agent.device = :t

      elsif @product.first =~ /iPhone/
        @user_agent.os = :iph
        @user_agent.device = :m

      elsif @product.first =~ /Android/
        @user_agent.os = :adr

      elsif @product.first =~ /Mac\ OS/ and not @user_agent_string =~ /Mobile/
        @user_agent.os = :mac
        @user_agent.device = :c

      elsif @product.first =~ /Windows/ and not @user_agent_string =~ /Windows\ Phone/  and not @user_agent_string =~ /Touch/ 
        @user_agent.os = :win
        @user_agent.device = :c

      elsif @user_agent_string =~ /Windows\ Phone/ 
        @user_agent.os = :wip
        @user_agent.device = :m

      elsif @user_agent_string =~ /Windows/ and @user_agent_string =~ /Touch/
        @user_agent.os = :win
        @user_agent.device = :t
        @user_agent.browser = :ie

      elsif @user_agent_string =~ /PlayBook/
        @user_agent.os = :bkb
        @user_agent.device = :t
        @user_agent.browser = :oth

      elsif @product.first =~ /Linux|FreeBSD|Ubuntu/
        @user_agent.os = :lnx
        @user_agent.device = :c

      elsif @product.first =~ /BB10/
        @user_agent.os = :bkb
        @user_agent.device = :m
        @user_agent.browser = :oth

      elsif @user_agent_string =~ /Mobile/ or @product.first =~ /SymbOS|SymbianOS|webOS/
        @user_agent.os = :oth
        @user_agent.device = :m
        @user_agent.browser = :oth

      else
        @user_agent.os = :oth
        @user_agent.device = :oth
        @user_agent.browser = :oth

      end
    end
  
  
  end
end