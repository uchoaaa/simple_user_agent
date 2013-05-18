module Parsers
  module Device
    
    def identify_device
      if @user_agent.os == :adr

        if @user_agent_string =~ /Mobile/ 
          @user_agent.device = :m
        elsif @user_agent_string =~ /Tablet/ 
          @user_agent.device = :t
        else
          @user_agent.device = :t #Google Nexus. Ver link acima.
        end

      else
        @user_agent.device = :oth
      end
    end

  end
end