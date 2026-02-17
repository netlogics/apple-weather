class Weather < ApplicationRecord
  belongs_to :address
  validates :address, :forecast, presence: true
end
