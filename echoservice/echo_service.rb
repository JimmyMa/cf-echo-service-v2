require 'rubygems'
require 'sinatra'
require 'json'

class EchoService < Sinatra::Base

    get '/echo/:bind_id/:input' do
       "Echo: #{params['input']} for binding #{params['bind_id']}"
    end

end
