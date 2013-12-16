require 'rubygems'
require 'sinatra'
require 'json'
require 'httpclient'

class EchoServiceDemo < Sinatra::Base

    configure do
        services = JSON.parse(ENV['VCAP_SERVICES'])
        echo_key = services.keys.select { |svc| svc =~ /Echo/i }.first
        echo = services[echo_key].first['credentials']
        @@echo_url = echo['uri']
    end

    get '/varz' do
       "Running ..."
    end

    get '/' do
       message = params[:message]
       return "please input the message !!" if message.nil?
       echo = HTTPClient.new
       res = echo.get( "#{@@echo_url}/#{message}" )
       res.body
    end

end
