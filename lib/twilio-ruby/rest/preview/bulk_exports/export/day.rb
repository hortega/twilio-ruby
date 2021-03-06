##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class BulkExports < Version
        class ExportContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DayList < ListResource
            ##
            # Initialize the DayList
            # @param [Version] version Version that contains the resource
            # @param [String] resource_type The resource_type
            # @return [DayList] DayList
            def initialize(version, resource_type: nil)
              super(version)

              # Path Solution
              @solution = {
                  resource_type: resource_type
              }
              @uri = "/Exports/#{@solution[:resource_type]}/Days"
            end

            ##
            # Lists DayInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams DayInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields DayInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(
                  page_size: limits[:page_size],
              )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of DayInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of DayInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              DayPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of DayInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of DayInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              DayPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.BulkExports.DayList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DayPage < Page
            ##
            # Initialize the DayPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [DayPage] DayPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of DayInstance
            # @param [Hash] payload Payload response from the API
            # @return [DayInstance] DayInstance
            def get_instance(payload)
              DayInstance.new(
                  @version,
                  payload,
                  resource_type: @solution[:resource_type],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.BulkExports.DayPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DayInstance < InstanceResource
            ##
            # Initialize the DayInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] resource_type The resource_type
            # @return [DayInstance] DayInstance
            def initialize(version, payload, resource_type: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'redirect_to' => payload['redirect_to'],
                  'day' => payload['day'],
                  'size' => payload['size'].to_i,
                  'resource_type' => payload['resource_type'],
              }
            end

            ##
            # @return [String] The redirect_to
            def redirect_to
              @properties['redirect_to']
            end

            ##
            # @return [String] The day
            def day
              @properties['day']
            end

            ##
            # @return [String] The size
            def size
              @properties['size']
            end

            ##
            # @return [String] The resource_type
            def resource_type
              @properties['resource_type']
            end

            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Preview.BulkExports.DayInstance>"
            end
          end
        end
      end
    end
  end
end