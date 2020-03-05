FactoryBot.define do
  factory :country do
    to_create do |instance|
      instance.attributes = Country.find_or_create_by(name: instance.name, code: instance.code).attributes
      instance.reload
    end

    name { 'Canada' }
    code { 'CA' }
    inhabitants { SecureRandom.rand(10..100_000_000) }
  end
end
