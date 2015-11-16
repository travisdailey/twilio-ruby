##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class SmsMessageList < ListResource
      ##
      # Initialize the SmsMessageList
      def initialize(version, account_sid: nil)
        super(version)
        
        # Path Solution
        @solution = {
            account_sid: account_sid
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/SMS/Messages.json"
      end
      
      ##
      # Create a new SmsMessageInstance
      def create(to, from, status_callback: nil, application_sid: nil, body: nil, media_url: nil)
        data = {
            'To' => to,
            'From' => from,
            'Body' => body,
            'MediaUrl' => media_url,
            'StatusCallback' => status_callback,
            'ApplicationSid' => application_sid,
        }
        
        payload = @version.create(
            'POST',
            @uri,
            data
        )
        
        return SmsMessageInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
        )
      end
      
      ##
      # Reads SmsMessageInstance records from the API as a list.
      def list(to: nil, from: nil, date_sent_before: nil, date_sent: nil, date_sent_after: nil, limit: nil, page_size: nil)
        self.stream(
            to: to,
            from: from,
            date_sent_before: date_sent_before,
            date_sent: date_sent,
            date_sent_after: date_sent_after,
            limit: limit,
            page_size: page_size
        ).entries
      end
      
      def stream(to: nil, from: nil, date_sent_before: nil, date_sent: nil, date_sent_after: nil, limit: nil, page_size: nil)
        limits = @version.read_limits(limit, page_size)
        
        page = self.page(
            to: to,
            from: from,
            date_sent_before: date_sent_before,
            date_sent: date_sent,
            date_sent_after: date_sent_after,
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
      # Retrieve a single page of SmsMessageInstance records from the API.
      def page(to: nil, from: nil, date_sent_before: nil, date_sent: nil, date_sent_after: nil, page_token: nil, page_number: nil, page_size: nil)
        params = {
            'To' => to,
            'From' => from,
            'DateSent<' => Twilio.serialize_iso8601(date_sent_before),
            'DateSent' => Twilio.serialize_iso8601(date_sent),
            'DateSent>' => Twilio.serialize_iso8601(date_sent_after),
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        response = @version.page(
            'GET',
            @uri,
            params
        )
        return SmsMessagePage.new(
            @version,
            response,
            account_sid: @solution['account_sid'],
        )
      end
      
      ##
      # Constructs a SmsMessageContext
      def get(sid)
        SmsMessageContext.new(
            @version,
            account_sid: @solution[:account_sid],
            sid: sid,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.SmsMessageList>'
      end
    end
  
    class SmsMessagePage < Page
      def initialize(version, response, account_sid)
        super(version, response)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid,
        }
      end
      
      def get_instance(payload)
        return SmsMessageInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio.Api.V2010.SmsMessagePage>'
      end
    end
  
    class SmsMessageContext < InstanceContext
      def initialize(version, account_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            account_sid: account_sid,
            sid: sid,
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/SMS/Messages/#{@solution[:sid]}.json"
      end
      
      ##
      # Deletes the SmsMessageInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      ##
      # Fetch a SmsMessageInstance
      def fetch
        params = {}
        
        @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return SmsMessageInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Update the SmsMessageInstance
      def update(body: nil)
        data = {
            'Body' => body,
        }
        
        payload = @version.update(
            'POST',
            @uri,
            data=data,
        )
        
        return SmsMessageInstance(
            self._version,
            payload,
            account_sid: @solution['account_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Api.V2010.SmsMessageContext #{context}>"
      end
    end
  
    class SmsMessageInstance < InstanceResource
      def initialize(version, payload, account_sid, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'api_version' => payload['api_version'],
            'body' => payload['body'],
            'date_created' => Time.rfc2822(payload['date_created']),
            'date_updated' => Time.rfc2822(payload['date_updated']),
            'date_sent' => Time.rfc2822(payload['date_sent']),
            'direction' => payload['direction'],
            'from' => payload['from'],
            'price' => payload['price'].to_f,
            'price_unit' => payload['price_unit'],
            'sid' => payload['sid'],
            'status' => payload['status'],
            'to' => payload['to'],
            'uri' => payload['uri'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'account_sid' => account_sid,
            'sid' => sid || @properties['sid'],
        }
      end
      
      def context
        unless @instance_context
          @instance_context = SmsMessageContext.new(
              @version,
              @params['account_sid'],
              @params['sid'],
          )
        end
        @instance_context
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def api_version
        @properties['api_version']
      end
      
      def body
        @properties['body']
      end
      
      def date_created
        @properties['date_created']
      end
      
      def date_updated
        @properties['date_updated']
      end
      
      def date_sent
        @properties['date_sent']
      end
      
      def direction
        @properties['direction']
      end
      
      def from
        @properties['from']
      end
      
      def price
        @properties['price']
      end
      
      def price_unit
        @properties['price_unit']
      end
      
      def sid
        @properties['sid']
      end
      
      def status
        @properties['status']
      end
      
      def to
        @properties['to']
      end
      
      def uri
        @properties['uri']
      end
      
      ##
      # Deletes the SmsMessageInstance
      def delete
        @context.delete()
      end
      
      ##
      # Fetch a SmsMessageInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Update the SmsMessageInstance
      def update(body: nil)
        @context.update()
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Api.V2010.SmsMessageInstance #{context}>"
      end
    end
  end
end