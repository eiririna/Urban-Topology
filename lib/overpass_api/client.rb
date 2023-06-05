# frozen_string_literal: true

require 'httparty'

module OverpassApi
  class Client
    include HTTParty

    base_uri 'https://overpass-api.de/api/interpreter'

    def self.query_routes(city_name)
      query = "[out:json];area[name='#{city_name}']->.a;(relation(area.a)['route'='bus'];relation(area.a)['route'='tram'];relation(area.a)['route'='subway'];relation(area.a)['route'='train'];);out;"
      encoded_query = URI.encode_www_form_component(query)
      url = "#{base_uri}?data=#{encoded_query}"

      response = get(url)
      if response.success?
        JSON.parse(response.body)
      else
        raise "Error retrieving routes: #{response.code} - #{response.message}"
      end
    end
  end
end
