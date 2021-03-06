##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class AddressContext < InstanceContext
            class DependentPhoneNumberList < ListResource
              ##
              # Initialize the DependentPhoneNumberList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] address_sid The sid
              # @return [DependentPhoneNumberList] DependentPhoneNumberList
              def initialize(version, account_sid: nil, address_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    address_sid: address_sid
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Addresses/#{@solution[:address_sid]}/DependentPhoneNumbers.json"
              end

              ##
              # Lists DependentPhoneNumberInstance records from the API as a list.
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
              # Streams DependentPhoneNumberInstance records from the API as an Enumerable.
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
              # When passed a block, yields DependentPhoneNumberInstance records from the API.
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
              # Retrieve a single page of DependentPhoneNumberInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of DependentPhoneNumberInstance
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
                DependentPhoneNumberPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of DependentPhoneNumberInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of DependentPhoneNumberInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                DependentPhoneNumberPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.DependentPhoneNumberList>'
              end
            end

            class DependentPhoneNumberPage < Page
              ##
              # Initialize the DependentPhoneNumberPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [DependentPhoneNumberPage] DependentPhoneNumberPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of DependentPhoneNumberInstance
              # @param [Hash] payload Payload response from the API
              # @return [DependentPhoneNumberInstance] DependentPhoneNumberInstance
              def get_instance(payload)
                DependentPhoneNumberInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    address_sid: @solution[:address_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.DependentPhoneNumberPage>'
              end
            end

            class DependentPhoneNumberInstance < InstanceResource
              ##
              # Initialize the DependentPhoneNumberInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The account_sid
              # @param [String] address_sid The sid
              # @return [DependentPhoneNumberInstance] DependentPhoneNumberInstance
              def initialize(version, payload, account_sid: nil, address_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'friendly_name' => payload['friendly_name'],
                    'phone_number' => payload['phone_number'],
                    'lata' => payload['lata'],
                    'rate_center' => payload['rate_center'],
                    'latitude' => payload['latitude'].to_f,
                    'longitude' => payload['longitude'].to_f,
                    'region' => payload['region'],
                    'postal_code' => payload['postal_code'],
                    'iso_country' => payload['iso_country'],
                    'address_requirements' => payload['address_requirements'],
                    'capabilities' => payload['capabilities'],
                }
              end

              ##
              # @return [String] The friendly_name
              def friendly_name
                @properties['friendly_name']
              end

              ##
              # @return [String] The phone_number
              def phone_number
                @properties['phone_number']
              end

              ##
              # @return [String] The lata
              def lata
                @properties['lata']
              end

              ##
              # @return [String] The rate_center
              def rate_center
                @properties['rate_center']
              end

              ##
              # @return [String] The latitude
              def latitude
                @properties['latitude']
              end

              ##
              # @return [String] The longitude
              def longitude
                @properties['longitude']
              end

              ##
              # @return [String] The region
              def region
                @properties['region']
              end

              ##
              # @return [String] The postal_code
              def postal_code
                @properties['postal_code']
              end

              ##
              # @return [String] The iso_country
              def iso_country
                @properties['iso_country']
              end

              ##
              # @return [String] The address_requirements
              def address_requirements
                @properties['address_requirements']
              end

              ##
              # @return [String] The capabilities
              def capabilities
                @properties['capabilities']
              end

              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Api.V2010.DependentPhoneNumberInstance>"
              end
            end
          end
        end
      end
    end
  end
end