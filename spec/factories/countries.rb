FactoryBot.define do
  factory :country do
    to_create do |instance|
      precedent_record = Country.find_by(code: instance.code) # find by all attributes involved in the uniqueness
      if precedent_record
        instance.id = precedent_record.id
      else
        instance.save!
      end
      instance.reload
    end

    name { 'Canada' }
    code { 'CA' }
    inhabitants { SecureRandom.rand(10..100_000_000) }
  end
end
