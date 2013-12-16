require 'rubygems'
require 'sinatra'
require 'json'

class EchoServiceBroker < Sinatra::Base

    get '/varz' do
       "Running ..."
    end

    get '/v2/catalog' do
        content_type :json
        {
          "services" => [{
            "id" => "408ad845-132c-4d0a-a1f8-aab13a5c219c",
            "name" => "Echo Server",
            "description" => "An Echo Server",
            "bindable" => true,
            "plans" => [{
              "id" => "26f97282-0b99-4a7e-8065-7d94a5e413c6",
              "name" => "Free Echo Server",
              "description" => "An Echo Server -- Free"
            },{
              "id" => "facb2b90-ba68-48ef-924c-5a8a67710577",
              "name" => "Not Free Echo Server",
              "description" => "An Echo Server -- Not Free"
            }]
          }]
        }.to_json
    end

    #Create a service instance
    put '/v2/service_instances/:id' do
        content_type :json
        {
          "dashboard_url" => "http://jimmyechoserver.ng.w3.bluemix.net/console?access_token=3hjdsnqadw487232lp"
        }.to_json
    end

    #Bind to an app
    put '/v2/service_instances/:instance_id/service_bindings/:id' do
        content_type :json
        {
          "credentials" => {
            "uri" => "http://myname:mypass@jimmyechoserver.ng.w3.bluemix.net/echo/#{params['id']}",
            "username" => "myname",
            "password" => "mypass"
          }
        }.to_json
    end

    #Unbind from an app
    delete '/v2/service_instances/:instance_id/service_bindings/:id' do
        status(200)
        {}.to_json
    end

    #Delete the service instance
    delete '/v2/service_instances/:id' do
        status(200)
        {}.to_json
    end

end

