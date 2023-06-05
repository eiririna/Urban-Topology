# frozen_string_literal: true

module OverpassApi
  class RoutesImporterService
    def initialize(city_name)
      @city_name = city_name
    end

    def call
      routes = OverpassApi::Client.query_routes(@city_name)
      routes.dig('elements').each do |route|
        public_route = OverpassApi::RoutesSaverService.call(route)

        route.dig("members").each do |member|
          node_id = member.dig("ref")

          if member.dig("type") == "node"
            stop_data = OpenstreetmapApi::Client.get_node(node_id)
            public_stop = Stop.find_or_create_by(stop_data)
            RouteStop.create(route_id: public_route.id, stop_id: public_stop.id)
          end
        end
      end
    end
  end
end
