##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class UsageList < ListResource
      ##
      # Initialize the UsageList
      def initialize(version, account_sid: nil)
        super(version)
        
        # Path Solution
        @solution = {
            account_sid: account_sid
        }
        
        # Components
        @records = nil
        @triggers = nil
      end
      
      ##
      # Access the records
      def records
        @records ||= RecordList.new(@version, @solution)
      end
      
      ##
      # Access the triggers
      def triggers
        @triggers ||= TriggerList.new(@version, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.UsageList>'
      end
    end
  
    class UsagePage < Page
      def initialize(version, response, account_sid)
        super(version, response)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid,
        }
      end
      
      def get_instance(payload)
        return UsageInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio.Api.V2010.UsagePage>'
      end
    end
  
    class UsageInstance < InstanceResource
      def initialize(version, payload)
        super(version)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        "<Twilio.Api.V2010.UsageInstance>"
      end
    end
  end
end