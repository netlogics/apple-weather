require 'rails_helper'

RSpec.describe WeatherProviders::WeatherApi do
  let(:address) { build :address }
  subject(:weather_api_klass) { WeatherProviders::WeatherApi }

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
    end

    context 'kwargs constraints' do
      it "doesn't accept arbitrary kwargs" do
        expect { subject.new(address: address, foobar: 5) }.to raise_error ArgumentError
      end
    end

    describe "#lookup" do
      subject(:weather_api) { weather_api_klass.new(address: build(:real_address)) }
      let(:forecast) { subject.lookup }

      context "success response" do
        it "returns a hash" do
          expect(subject.lookup).to be_a Hash
        end

        it "contains the weather forecast" do
          expect(forecast).to include("forecast")
        end

        it "contains the weather location" do
          expect(forecast).to include("location")
        end

        it "contains the weather alerts" do
          expect(forecast).to include("alerts")
        end
      end
    end
  end
end
