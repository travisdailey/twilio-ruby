##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class CountryList < ListResource
      ##
      # Initialize the CountryList
      def initialize(version)
        super(version)
        
        # Path Solution
        @solution = {}
        @uri = "/Voice/Countries"
      end
      
      ##
      # Reads CountryInstance records from the API as a list.
      def list(limit: nil, page_size: nil)
        self.stream(
            limit: limit,
            page_size: page_size
        ).entries
      end
      
      def stream(limit: nil, page_size: nil)
        limits = @version.read_limits(limit, page_size)
        
        page = self.page(
            page_size: limits['page_size'],
        )
        
        return @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
      end
      
      def each
        limits = @version.read_limits
        
        page = self.page(
            page_size: limits['page_size'],
        )
        
        @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
      end
      
      ##
      # Retrieve a single page of CountryInstance records from the API.
      def page(page_token: nil, page_number: nil, page_size: nil)
        params = {
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        response = @version.page(
            'GET',
            @uri,
            params
        )
        return CountryPage.new(
            @version,
            response,
        )
      end
      
      ##
      # Constructs a CountryContext
      def get(iso_country)
        CountryContext.new(
            @version,
            iso_country: iso_country,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Pricing.V1.CountryList>'
      end
    end
  
    class CountryPage < Page
      def initialize(version, response)
        super(version, response)
        
        # Path Solution
        @solution = {}
      end
      
      def get_instance(payload)
        return CountryInstance.new(
            @version,
            payload,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio.Pricing.V1.CountryPage>'
      end
    end
  
    class CountryContext < InstanceContext
      def initialize(version, iso_country)
        super(version)
        
        # Path Solution
        @solution = {
            iso_country: iso_country,
        }
        @uri = "/Voice/Countries/#{@solution[:iso_country]}"
      end
      
      ##
      # Fetch a CountryInstance
      def fetch
        params = {}
        
        @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return CountryInstance.new(
            @version,
            payload,
            iso_country: @solution['iso_country'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Pricing.V1.CountryContext #{context}>"
      end
    end
  
    class CountryInstance < InstanceResource
      def initialize(version, payload, iso_country: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'iso_country' => payload['iso_country'],
            'country' => payload['country'],
            'url' => payload['url'],
            'outbound_prefix_prices' => payload.get('outbound_prefix_prices'),
            'price_unit' => payload.get('price_unit'),
            'inbound_call_prices' => payload.get('inbound_call_prices'),
        }
        
        # Context
        @instance_context = nil
        @params = {
            'iso_country' => iso_country || @properties['iso_country'],
        }
      end
      
      def context
        unless @instance_context
          @instance_context = CountryContext.new(
              @version,
              @params['iso_country'],
          )
        end
        @instance_context
      end
      
      def url
        @properties['url']
      end
      
      def iso_country
        @properties['iso_country']
      end
      
      def outbound_prefix_prices
        @properties['outbound_prefix_prices']
      end
      
      def price_unit
        @properties['price_unit']
      end
      
      def country
        @properties['country']
      end
      
      def inbound_call_prices
        @properties['inbound_call_prices']
      end
      
      ##
      # Fetch a CountryInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Pricing.V1.CountryInstance #{context}>"
      end
    end
  end
end