# frozen_string_literal: true

module OverpassApi
  class RoutesSaverService
    def self.call(route)
        Route.create(
          from: route.dig('tags', 'from'),
          to: route.dig('tags', 'to'),
          route: route.dig('tags', 'route'),
          ref: route.dig('tags', 'ref'),
          colour: route.dig('tags', 'colour'),
          network: route.dig('tags', 'network'),
          operator: route.dig('tags', 'operator'),
          website: route.dig('tags', 'website')
        )
    end
  end
end
