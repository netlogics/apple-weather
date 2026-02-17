class Address < ApplicationRecord
  has_many :forecasts
  validates :city, :state, :zip, presence: true
end
