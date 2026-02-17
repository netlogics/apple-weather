# Apple Weather
This is a basic implementation of a weather forecast application. 
* The entrypoint is a service object called WeatherService (app/services/weather_service.rb). 
* The WeatherService class uses composition over inheritance via the ruby Forwardable module to proxy weather forecast providers. Providers can be swapped out via the WeatherService::DEFAULT_PROVIDER_KLASS constant or injected as a constructor arg.
    * Note: This partial implementation of the adapter pattern is in violation of the rule of three since there is currently only one weather provider. However, adding a single layer of abstraction through a service object can provide some benefits and possibly justify such a violation. This is how I think about some of the the pros of the tradeoff:
        * An abstraction that is actually used
        * Constrains coupling
        * Minimal cognitive burden
        * Has a natural feel
* In lieu of interfaces, the unwritten contract is that every WeatherProvider must provide a method named `lookup`. The `lookup` method needs to return a hash of weather forecast data. 
* WeatherProviders::WeatherApi is currently the only weather provider. 


## ruby version
3.4.3
## sqlite3 version
3.26.0 
## rails version
8.0.2
## create database
rails db:schema:load
## run tests
rails rspec
* Note: currently there are only unit/model tests for AR models and PORO's

## todo
* Add controllers and views
* Add caching
* Add documentation
