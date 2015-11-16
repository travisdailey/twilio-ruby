##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class TrunkList < ListResource
      ##
      # Initialize the TrunkList
      def initialize(version)
        super(version)
        
        # Path Solution
        @solution = {}
        @uri = "/Trunks"
      end
      
      ##
      # Create a new TrunkInstance
      def create(friendly_name: nil, domain_name: nil, disaster_recovery_url: nil, disaster_recovery_method: nil, recording: nil, secure: nil)
        data = {
            'FriendlyName' => friendly_name,
            'DomainName' => domain_name,
            'DisasterRecoveryUrl' => disaster_recovery_url,
            'DisasterRecoveryMethod' => disaster_recovery_method,
            'Recording' => recording,
            'Secure' => secure,
        }
        
        payload = @version.create(
            'POST',
            @uri,
            data
        )
        
        return TrunkInstance.new(
            @version,
            payload,
        )
      end
      
      ##
      # Reads TrunkInstance records from the API as a list.
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
      # Retrieve a single page of TrunkInstance records from the API.
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
        return TrunkPage.new(
            @version,
            response,
        )
      end
      
      ##
      # Constructs a TrunkContext
      def get(sid)
        TrunkContext.new(
            @version,
            sid: sid,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Trunking.V1.TrunkList>'
      end
    end
  
    class TrunkPage < Page
      def initialize(version, response)
        super(version, response)
        
        # Path Solution
        @solution = {}
      end
      
      def get_instance(payload)
        return TrunkInstance.new(
            @version,
            payload,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio.Trunking.V1.TrunkPage>'
      end
    end
  
    class TrunkContext < InstanceContext
      def initialize(version, sid)
        super(version)
        
        # Path Solution
        @solution = {
            sid: sid,
        }
        @uri = "/Trunks/#{@solution[:sid]}"
        
        # Dependents
        @origination_urls = nil
        @credentials_lists = nil
        @ip_access_control_lists = nil
        @phone_numbers = nil
      end
      
      ##
      # Fetch a TrunkInstance
      def fetch
        params = {}
        
        @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return TrunkInstance.new(
            @version,
            payload,
            sid: @solution['sid'],
        )
      end
      
      ##
      # Deletes the TrunkInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      ##
      # Update the TrunkInstance
      def update(friendly_name: nil, domain_name: nil, disaster_recovery_url: nil, disaster_recovery_method: nil, recording: nil, secure: nil)
        data = {
            'FriendlyName' => friendly_name,
            'DomainName' => domain_name,
            'DisasterRecoveryUrl' => disaster_recovery_url,
            'DisasterRecoveryMethod' => disaster_recovery_method,
            'Recording' => recording,
            'Secure' => secure,
        }
        
        payload = @version.update(
            'POST',
            @uri,
            data=data,
        )
        
        return TrunkInstance(
            self._version,
            payload,
            sid: @solution['sid'],
        )
      end
      
      def origination_urls(sid=:unset)
        if sid != :unset
          return OriginationUrlContext.new(
              @version,
              @solution[:sid],
              sid,
          )
        end
        
        unless @origination_urls
          @origination_urls = OriginationUrlList.new(
              @version,
              trunk_sid: @solution[:sid],
          )
        end
        
        @origination_urls
      end
      
      def credentials_lists(sid=:unset)
        if sid != :unset
          return CredentialListContext.new(
              @version,
              @solution[:sid],
              sid,
          )
        end
        
        unless @credentials_lists
          @credentials_lists = CredentialListList.new(
              @version,
              trunk_sid: @solution[:sid],
          )
        end
        
        @credentials_lists
      end
      
      def ip_access_control_lists(sid=:unset)
        if sid != :unset
          return IpAccessControlListContext.new(
              @version,
              @solution[:sid],
              sid,
          )
        end
        
        unless @ip_access_control_lists
          @ip_access_control_lists = IpAccessControlListList.new(
              @version,
              trunk_sid: @solution[:sid],
          )
        end
        
        @ip_access_control_lists
      end
      
      def phone_numbers(sid=:unset)
        if sid != :unset
          return PhoneNumberContext.new(
              @version,
              @solution[:sid],
              sid,
          )
        end
        
        unless @phone_numbers
          @phone_numbers = PhoneNumberList.new(
              @version,
              trunk_sid: @solution[:sid],
          )
        end
        
        @phone_numbers
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Trunking.V1.TrunkContext #{context}>"
      end
    end
  
    class TrunkInstance < InstanceResource
      def initialize(version, payload, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'domain_name' => payload['domain_name'],
            'disaster_recovery_method' => payload['disaster_recovery_method'],
            'disaster_recovery_url' => payload['disaster_recovery_url'],
            'friendly_name' => payload['friendly_name'],
            'secure' => payload['secure'],
            'recording' => payload['recording'],
            'auth_type' => payload['auth_type'],
            'auth_type_set' => payload['auth_type_set'],
            'date_created' => Time.iso8601(payload['date_created']),
            'date_updated' => Time.iso8601(payload['date_updated']),
            'sid' => payload['sid'],
            'url' => payload['url'],
            'links' => payload['links'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'sid' => sid || @properties['sid'],
        }
      end
      
      def context
        unless @instance_context
          @instance_context = TrunkContext.new(
              @version,
              @params['sid'],
          )
        end
        @instance_context
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def domain_name
        @properties['domain_name']
      end
      
      def disaster_recovery_method
        @properties['disaster_recovery_method']
      end
      
      def disaster_recovery_url
        @properties['disaster_recovery_url']
      end
      
      def friendly_name
        @properties['friendly_name']
      end
      
      def secure
        @properties['secure']
      end
      
      def recording
        @properties['recording']
      end
      
      def auth_type
        @properties['auth_type']
      end
      
      def auth_type_set
        @properties['auth_type_set']
      end
      
      def date_created
        @properties['date_created']
      end
      
      def date_updated
        @properties['date_updated']
      end
      
      def sid
        @properties['sid']
      end
      
      def url
        @properties['url']
      end
      
      def links
        @properties['links']
      end
      
      ##
      # Fetch a TrunkInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Deletes the TrunkInstance
      def delete
        @context.delete()
      end
      
      ##
      # Update the TrunkInstance
      def update(friendly_name: nil, domain_name: nil, disaster_recovery_url: nil, disaster_recovery_method: nil, recording: nil, secure: nil)
        @context.update(
            domain_name: nil,
            disaster_recovery_url: nil,
            disaster_recovery_method: nil,
            recording: nil,
            secure: nil,
        )
      end
      
      def origination_urls
        @context.origination_urls
      end
      
      def credentials_lists
        @context.credentials_lists
      end
      
      def ip_access_control_lists
        @context.ip_access_control_lists
      end
      
      def phone_numbers
        @context.phone_numbers
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Trunking.V1.TrunkInstance #{context}>"
      end
    end
  end
end