FactoryBot.define do
  factory :weather do
    forecast { file_fixture("forecast.json").read.gsub(/\s+/, "") }
    address { create :address }
  end
end
