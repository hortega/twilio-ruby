##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class FeedbackSummaryList < ListResource
      ##
      # Initialize the FeedbackSummaryList
      def initialize(version, account_sid)
        super(version)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/Calls/FeedbackSummary.json"
      end
      
      ##
      # Create a new FeedbackSummaryInstance
      def create(start_date, end_date, include_subaccounts: nil, status_callback: nil, status_callback_method: nil)
        data = {
            'StartDate' => serialize.iso8601_date(start_date),
            'EndDate' => serialize.iso8601_date(end_date),
            'IncludeSubaccounts' => include_subaccounts,
            'StatusCallback' => status_callback,
            'StatusCallbackMethod' => status_callback_method,
        }
        
        @version.create(
            FeedbackSummaryInstance,
            @solution,
            'POST',
            @uri,
            {},
            data
        )
      end
      
      ##
      # Constructs a FeedbackSummaryContext
      def get(sid)
        FeedbackSummaryContext.new(@version, sid, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.FeedbackSummaryList>'
      end
    end
  
    class FeedbackSummaryContext < InstanceContext
      def initialize(version, account_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid,
            'sid' => sid,
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/Calls/FeedbackSummary/#{@solution[:sid]}.json"
      end
      
      ##
      # Fetch a FeedbackSummaryInstance
      def fetch
        params = {}
        
        @version.fetch(
            FeedbackSummaryInstance,
            @solution,
            'GET',
            @uri,
            params,
        )
      end
      
      ##
      # Deletes the FeedbackSummaryInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Api.V2010.FeedbackSummaryContext #{context}>"
      end
    end
  
    class FeedbackSummaryInstance < InstanceResource
      def initialize(version, payload, account_sid, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'call_count' => deserialize.integer(payload['call_count']),
            'call_feedback_count' => deserialize.integer(payload['call_feedback_count']),
            'date_created' => deserialize.rfc2822_datetime(payload['date_created']),
            'date_updated' => deserialize.rfc2822_datetime(payload['date_updated']),
            'end_date' => deserialize.rfc2822_datetime(payload['end_date']),
            'include_subaccounts' => payload['include_subaccounts'],
            'issues' => payload['issues'],
            'quality_score_average' => deserialize.decimal(payload['quality_score_average']),
            'quality_score_median' => deserialize.decimal(payload['quality_score_median']),
            'quality_score_standard_deviation' => deserialize.decimal(payload['quality_score_standard_deviation']),
            'sid' => payload['sid'],
            'start_date' => deserialize.rfc2822_datetime(payload['start_date']),
            'status' => payload['status'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'account_sid' => account_sid,
            'sid' => sid || @properties['sid'],
        }
      end
      
      def _context
        unless @instance_context
          @instance_context = FeedbackSummaryContext(
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
      
      def call_count
        @properties['call_count']
      end
      
      def call_feedback_count
        @properties['call_feedback_count']
      end
      
      def date_created
        @properties['date_created']
      end
      
      def date_updated
        @properties['date_updated']
      end
      
      def end_date
        @properties['end_date']
      end
      
      def include_subaccounts
        @properties['include_subaccounts']
      end
      
      def issues
        @properties['issues']
      end
      
      def quality_score_average
        @properties['quality_score_average']
      end
      
      def quality_score_median
        @properties['quality_score_median']
      end
      
      def quality_score_standard_deviation
        @properties['quality_score_standard_deviation']
      end
      
      def sid
        @properties['sid']
      end
      
      def start_date
        @properties['start_date']
      end
      
      def status
        @properties['status']
      end
      
      ##
      # Fetch a FeedbackSummaryInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Deletes the FeedbackSummaryInstance
      def delete
        @context.delete()
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Api.V2010.FeedbackSummaryInstance #{context}>"
      end
    end
  end
end