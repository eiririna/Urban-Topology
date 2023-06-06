# frozen_string_literal: true

require 'httparty'

module OpenstreetmapApi
  class Client
    include HTTParty

    base_uri 'https://api.openstreetmap.org'

    def self.get_node(node_id)
      response = get("/api/0.6/node/#{node_id}")
      return nil unless response.success?

      parse_node(response.body, node_id)
    end

    private

    def self.parse_node(xml, node_id)
      node_data = Hash.from_xml(xml)['osm']['node']
      lat = node_data['lat']
      lon = node_data['lon']
      name_tag = node_data['tag'].find { |tag| tag['k'] == 'name' }
      name = name_tag.present? ? name_tag['v'] : ""
      { lat: lat, lon: lon, name: name, ref: node_id }
    end
  end
end
