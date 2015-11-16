##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class CredentialListList < ListResource
      ##
      # Initialize the CredentialListList
      def initialize(version, trunk_sid: nil)
        super(version)
        
        # Path Solution
        @solution = {
            trunk_sid: trunk_sid
        }
        @uri = "/Trunks/#{@solution[:trunk_sid]}/CredentialLists"
      end
      
      ##
      # Create a new CredentialListInstance
      def create(credential_list_sid)
        data = {
            'CredentialListSid' => credential_list_sid,
        }
        
        payload = @version.create(
            'POST',
            @uri,
            data
        )
        
        return CredentialListInstance.new(
            @version,
            payload,
            trunk_sid: @solution['trunk_sid'],
        )
      end
      
      ##
      # Reads CredentialListInstance records from the API as a list.
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
      # Retrieve a single page of CredentialListInstance records from the API.
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
        return CredentialListPage.new(
            @version,
            response,
            trunk_sid: @solution['trunk_sid'],
        )
      end
      
      ##
      # Constructs a CredentialListContext
      def get(sid)
        CredentialListContext.new(
            @version,
            trunk_sid: @solution[:trunk_sid],
            sid: sid,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Trunking.V1.CredentialListList>'
      end
    end
  
    class CredentialListPage < Page
      def initialize(version, response, trunk_sid)
        super(version, response)
        
        # Path Solution
        @solution = {
            'trunk_sid' => trunk_sid,
        }
      end
      
      def get_instance(payload)
        return CredentialListInstance.new(
            @version,
            payload,
            trunk_sid: @solution['trunk_sid'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio.Trunking.V1.CredentialListPage>'
      end
    end
  
    class CredentialListContext < InstanceContext
      def initialize(version, trunk_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            trunk_sid: trunk_sid,
            sid: sid,
        }
        @uri = "/Trunks/#{@solution[:trunk_sid]}/CredentialLists/#{@solution[:sid]}"
      end
      
      ##
      # Fetch a CredentialListInstance
      def fetch
        params = {}
        
        @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return CredentialListInstance.new(
            @version,
            payload,
            trunk_sid: @solution['trunk_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Deletes the CredentialListInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Trunking.V1.CredentialListContext #{context}>"
      end
    end
  
    class CredentialListInstance < InstanceResource
      def initialize(version, payload, trunk_sid, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'sid' => payload['sid'],
            'trunk_sid' => payload['trunk_sid'],
            'friendly_name' => payload['friendly_name'],
            'date_created' => Time.iso8601(payload['date_created']),
            'date_updated' => Time.iso8601(payload['date_updated']),
            'url' => payload['url'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'trunk_sid' => trunk_sid,
            'sid' => sid || @properties['sid'],
        }
      end
      
      def context
        unless @instance_context
          @instance_context = CredentialListContext.new(
              @version,
              @params['trunk_sid'],
              @params['sid'],
          )
        end
        @instance_context
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def sid
        @properties['sid']
      end
      
      def trunk_sid
        @properties['trunk_sid']
      end
      
      def friendly_name
        @properties['friendly_name']
      end
      
      def date_created
        @properties['date_created']
      end
      
      def date_updated
        @properties['date_updated']
      end
      
      def url
        @properties['url']
      end
      
      ##
      # Fetch a CredentialListInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Deletes the CredentialListInstance
      def delete
        @context.delete()
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Trunking.V1.CredentialListInstance #{context}>"
      end
    end
  end
end