##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class PhoneNumberList < ListResource
      ##
      # Initialize the PhoneNumberList
      def initialize(version)
        super(version)
        
        # Path Solution
        @solution = {}
        
        # Components
        @countries = nil
      end
      
      ##
      # Access the countries
      def countries
        @countries ||= CountryList.new(@version, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Pricing.V1.PhoneNumberList>'
      end
    end
  
    class PhoneNumberPage < Page
      def initialize(version, response)
        super(version, response)
        
        # Path Solution
        @solution = {}
      end
      
      def get_instance(payload)
        return PhoneNumberInstance.new(
            @version,
            payload,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio.Pricing.V1.PhoneNumberPage>'
      end
    end
  
    class PhoneNumberInstance < InstanceResource
      def initialize(version, payload)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'name' => payload['name'],
            'url' => payload['url'],
            'links' => payload['links'],
        }
      end
      
      def name
        @properties['name']
      end
      
      def url
        @properties['url']
      end
      
      def links
        @properties['links']
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        "<Twilio.Pricing.V1.PhoneNumberInstance>"
      end
    end
  end
end