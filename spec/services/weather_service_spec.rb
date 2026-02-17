require 'rails_helper'

RSpec.describe WeatherService do
  let(:address) { build :address }
  subject(:weather_service_klass) { WeatherService }

  describe '.new' do
    context 'required kwargs' do
      let(:constructor_args) {{ address: address  }}

      it "requires address kwargs" do
        expect { subject.new(**constructor_args) }.not_to raise_error
        constructor_args.except! :address
        expect { subject.new(**constructor_args) }.to raise_error StandardError, /missing keyword: :address/
      end
    end

    context 'optional kwargs' do
      it "accepts days" do
        expect { subject.new(address: address, days: 5) }.not_to raise_error
      end

      it "accepts version" do
        expect { subject.new(address: address, version: 2) }.not_to raise_error
      end

      it "accepts a provider" do
        expect { subject.new(address: address, provider: nil ) }.not_to raise_error
      end
    end

    context 'kwargs constraints' do
      it "doesn't accept arbitrary kwargs" do
        expect { subject.new(address: address, foobar: 5) }.to raise_error ArgumentError
      end
    end

    context 'passed a provider arg' do
      it "assigns the given provider" do
        acme_weather_provider = double("TntWeatherProvider")
        weather_service = subject.new(address: address, provider: acme_weather_provider)
        expect(weather_service.provider).to be(acme_weather_provider)
      end
    end

    context 'no provider arg' do
      it "instantiates the default provider" do
        expect(subject::DEFAULT_PROVIDER_KLASS).to receive(:new)
        weather_service = subject.new(address: address)
      end
    end
  end

  describe '#lookup' do
    let(:weather_service) { subject.new(address: build(:real_address)) }

    it 'delegates to the provider' do
      expect(weather_service.provider).to receive(:lookup)
      weather_service.lookup
    end
  end
end
