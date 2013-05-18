module Parsers
  module Device
    
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
end