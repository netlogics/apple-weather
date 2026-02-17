require 'net/http'

module WeatherProviders
  class WeatherApi
    attr_reader :address, :days, :version

    API_KEY = ENV["WEATHER_API_KEY"] || ""
    DOMAIN = "api.weatherapi.com"
    PROTOCOL = "http"
    DEFAULT_VERSION = "v1"
    DEFAULT_DAYS = "1"

    delegate :city, :state, :zip, to: :address

    def initialize(address:, days: DEFAULT_DAYS, version: DEFAULT_VERSION)
      @address = address
      @days = days
      @version = version
    end

    def lookup
      response = Net::HTTP.get_response(request_uri)
      JSON.parse response.body
    end

    private

    def request_uri
      URI("#{protocol}://#{domain}/#{self.version}/forecast.json?key=#{api_key}&q=#{ordinal_search_terms}&days=#{self.days}&alerts=yes")
    end

    def ordinal_search_terms
      return "#{zip}" if zip.present?
      return "#{city} #{state}" if city_and_state?
      return "#{city}" if city.present?
    end

    def city_and_state?
      city.present? && state.present?
    end

    def api_key
      API_KEY
    end

    def domain
      DOMAIN
    end

    def protocol
      PROTOCOL
    end
  end
end
