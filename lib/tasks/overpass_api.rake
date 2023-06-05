# frozen_string_literal: true

namespace :overpass_api do
  desc 'Retrieve routes data from Overpass API and save to database'
  task routes: :environment do
    OverpassApi::RoutesImporterService.call
    puts 'Data retrieved and saved successfully!'
  end
end
