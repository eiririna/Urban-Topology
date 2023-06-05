class Stop < ApplicationRecord
  validates :name, :lat, :lon, :ref, presence: true
  has_many :route_stops, dependent: :destroy
  has_many :stops, through: :route_stops
end
