module Parsers
  module Device
    
    def identify_device
      if @user_agent.os == 'Android'

        if @user_agent_string =~ /Mobile/ 
          @user_agent.device = 'Mobile'
        elsif @user_agent_string =~ /Tablet/ 
          @user_agent.device = 'Tablet'
        else
          @user_agent.device = 'Tablet' #Google Nexus. Ver link acima.
        end

      else
        @user_agent.device = 'Other'
      end
    end

  end
end