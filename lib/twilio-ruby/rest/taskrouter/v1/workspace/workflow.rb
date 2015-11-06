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
      def initialize(version, workspace_sid)
        super(version)
        
        # Path Solution
        @solution = {
            'workspace_sid' => workspace_sid
        }
        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workflows"
      end
      
      ##
      # Reads WorkflowInstance records from the API as a list.
      def read(friendly_name: nil, limit: nil, page_size: nil)
        @version.read(
            limit: nil,
            page_size: nil
        )
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
        @version.page(
            self,
            WorkflowInstance,
            @solution,
            'GET',
            @uri,
            params
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
        
        @version.create(
            WorkflowInstance,
            @solution,
            'POST',
            @uri,
            {},
            data
        )
      end
      
      ##
      # Constructs a WorkflowContext
      def get(sid)
        WorkflowContext.new(@version, sid, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Taskrouter.V1.WorkflowList>'
      end
    end
  
    class WorkflowContext < InstanceContext
      def initialize(version, workspace_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            'workspace_sid' => workspace_sid,
            'sid' => sid,
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
            WorkflowInstance,
            @solution,
            'GET',
            @uri,
            params,
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
        
        @version.update(
            WorkflowInstance,
            @solution,
            'POST',
            @uri,
            {},
            data=data,
        )
      end
      
      ##
      # Deletes the WorkflowInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      def statistics
        unless @statistics
          @statistics = WorkflowStatisticsList.new(
              @version,
              workspace_sid: @solution[:workspace_sid],
              workflow_sid: @solution[:sid],
          )
        end
        @statistics
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
            'date_created' => deserialize.iso8601_datetime(payload['date_created']),
            'date_updated' => deserialize.iso8601_datetime(payload['date_updated']),
            'document_content_type' => payload['document_content_type'],
            'fallback_assignment_callback_url' => payload['fallback_assignment_callback_url'],
            'friendly_name' => payload['friendly_name'],
            'sid' => payload['sid'],
            'task_reservation_timeout' => deserialize.integer(payload['task_reservation_timeout']),
            'workspace_sid' => payload['workspace_sid'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'workspace_sid' => workspace_sid,
            'sid' => sid || @properties['sid'],
        }
      end
      
      def _context
        unless @instance_context
          @instance_context = WorkflowContext(
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