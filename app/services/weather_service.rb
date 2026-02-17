require 'forwardable'

class WeatherService
  extend Forwardable

  DEFAULT_PROVIDER_KLASS = WeatherProviders::WeatherApi
  DEFAULT_API_VERSION = "v1"
  DEFAULT_DAYS = 1

  attr_reader :provider
  def_delegators :@provider, :address, :city, :state, :zip, :days, :version, :lookup

  def initialize(address:, provider: nil, days: DEFAULT_DAYS, version: DEFAULT_API_VERSION)
    @provider = provider || default_provider_klass.new(address: address, days: days, version: version)
  end

  private

  def default_provider_klass
    DEFAULT_PROVIDER_KLASS
  end

  def default_days
    DEFAULT_DAYS
  end

  def default_api_version
    DEFAULT_API_VERSION
  end
end
