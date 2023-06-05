class Route < ApplicationRecord
  validates :from, :to, :route, :ref, presence: true
  has_many :route_stops, dependent: :destroy
  has_many :stops, through: :route_stops
end
