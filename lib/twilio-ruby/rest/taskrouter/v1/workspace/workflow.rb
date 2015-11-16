##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class WorkflowList < ListResource
      ##
      # Initialize the WorkflowList
      def initialize(version, workspace_sid: nil)
        super(version)
        
        # Path Solution
        @solution = {
            workspace_sid: workspace_sid
        }
        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workflows"
      end
      
      ##
      # Reads WorkflowInstance records from the API as a list.
      def list(friendly_name: nil, limit: nil, page_size: nil)
        self.stream(
            friendly_name: friendly_name,
            limit: limit,
            page_size: page_size
        ).entries
      end
      
      def stream(friendly_name: nil, limit: nil, page_size: nil)
        limits = @version.read_limits(limit, page_size)
        
        page = self.page(
            friendly_name: friendly_name,
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
      # Retrieve a single page of WorkflowInstance records from the API.
      def page(friendly_name: nil, page_token: nil, page_number: nil, page_size: nil)
        params = {
            'FriendlyName' => friendly_name,
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        response = @version.page(
            'GET',
            @uri,
            params
        )
        return WorkflowPage.new(
            @version,
            response,
            workspace_sid: @solution['workspace_sid'],
        )
      end
      
      ##
      # Create a new WorkflowInstance
      def create(friendly_name, configuration, assignment_callback_url, fallback_assignment_callback_url: nil, task_reservation_timeout: nil)
        data = {
            'FriendlyName' => friendly_name,
            'Configuration' => configuration,
            'AssignmentCallbackUrl' => assignment_callback_url,
            'FallbackAssignmentCallbackUrl' => fallback_assignment_callback_url,
            'TaskReservationTimeout' => task_reservation_timeout,
        }
        
        payload = @version.create(
            'POST',
            @uri,
            data
        )
        
        return WorkflowInstance.new(
            @version,
            payload,
            workspace_sid: @solution['workspace_sid'],
        )
      end
      
      ##
      # Constructs a WorkflowContext
      def get(sid)
        WorkflowContext.new(
            @version,
            workspace_sid: @solution[:workspace_sid],
            sid: sid,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Taskrouter.V1.WorkflowList>'
      end
    end
  
    class WorkflowPage < Page
      def initialize(version, response, workspace_sid)
        super(version, response)
        
        # Path Solution
        @solution = {
            'workspace_sid' => workspace_sid,
        }
      end
      
      def get_instance(payload)
        return WorkflowInstance.new(
            @version,
            payload,
            workspace_sid: @solution['workspace_sid'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio.Taskrouter.V1.WorkflowPage>'
      end
    end
  
    class WorkflowContext < InstanceContext
      def initialize(version, workspace_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            workspace_sid: workspace_sid,
            sid: sid,
        }
        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workflows/#{@solution[:sid]}"
        
        # Dependents
        @statistics = nil
      end
      
      ##
      # Fetch a WorkflowInstance
      def fetch
        params = {}
        
        @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return WorkflowInstance.new(
            @version,
            payload,
            workspace_sid: @solution['workspace_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Update the WorkflowInstance
      def update(friendly_name: nil, assignment_callback_url: nil, fallback_assignment_callback_url: nil, configuration: nil, task_reservation_timeout: nil)
        data = {
            'FriendlyName' => friendly_name,
            'AssignmentCallbackUrl' => assignment_callback_url,
            'FallbackAssignmentCallbackUrl' => fallback_assignment_callback_url,
            'Configuration' => configuration,
            'TaskReservationTimeout' => task_reservation_timeout,
        }
        
        payload = @version.update(
            'POST',
            @uri,
            data=data,
        )
        
        return WorkflowInstance(
            self._version,
            payload,
            workspace_sid: @solution['workspace_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Deletes the WorkflowInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      def statistics
        return WorkflowStatisticsContext.new(
            @version,
            @solution[:sid],
            @solution[:sid],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Taskrouter.V1.WorkflowContext #{context}>"
      end
    end
  
    class WorkflowInstance < InstanceResource
      def initialize(version, payload, workspace_sid, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'assignment_callback_url' => payload['assignment_callback_url'],
            'configuration' => payload['configuration'],
            'date_created' => Time.iso8601(payload['date_created']),
            'date_updated' => Time.iso8601(payload['date_updated']),
            'document_content_type' => payload['document_content_type'],
            'fallback_assignment_callback_url' => payload['fallback_assignment_callback_url'],
            'friendly_name' => payload['friendly_name'],
            'sid' => payload['sid'],
            'task_reservation_timeout' => payload['task_reservation_timeout'].to_i,
            'workspace_sid' => payload['workspace_sid'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'workspace_sid' => workspace_sid,
            'sid' => sid || @properties['sid'],
        }
      end
      
      def context
        unless @instance_context
          @instance_context = WorkflowContext.new(
              @version,
              @params['workspace_sid'],
              @params['sid'],
          )
        end
        @instance_context
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def assignment_callback_url
        @properties['assignment_callback_url']
      end
      
      def configuration
        @properties['configuration']
      end
      
      def date_created
        @properties['date_created']
      end
      
      def date_updated
        @properties['date_updated']
      end
      
      def document_content_type
        @properties['document_content_type']
      end
      
      def fallback_assignment_callback_url
        @properties['fallback_assignment_callback_url']
      end
      
      def friendly_name
        @properties['friendly_name']
      end
      
      def sid
        @properties['sid']
      end
      
      def task_reservation_timeout
        @properties['task_reservation_timeout']
      end
      
      def workspace_sid
        @properties['workspace_sid']
      end
      
      ##
      # Fetch a WorkflowInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Update the WorkflowInstance
      def update(friendly_name: nil, assignment_callback_url: nil, fallback_assignment_callback_url: nil, configuration: nil, task_reservation_timeout: nil)
        @context.update(
            assignment_callback_url: nil,
            fallback_assignment_callback_url: nil,
            configuration: nil,
            task_reservation_timeout: nil,
        )
      end
      
      ##
      # Deletes the WorkflowInstance
      def delete
        @context.delete()
      end
      
      def statistics
        @context.statistics
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Taskrouter.V1.WorkflowInstance #{context}>"
      end
    end
  end
end