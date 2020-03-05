FactoryBot.define do
  factory :country do
    to_create do |instance|
      instance.attributes = Country.find_or_create_by(name: instance.name, code: instance.code).attributes
      instance.reload
    end

    name { 'Canada' }
    code { 'CA' }
  end
end
