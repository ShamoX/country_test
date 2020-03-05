require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'FactoryBot' do
    describe '.build' do
      it 'should .save! succesfully' do
        expect { build(:country).save! }.to change { Country.count }.by(1)
      end

      it 'should not create a Country' do
        expect { build(:country) }.not_to change { Country.count }
      end

      it 'should not return a persisted instance' do
        country = build(:country)
        expect(country.id).to be_nil
        expect(country.created_at).to be_nil
        expect(country.updated_at).to be_nil
        expect(country.persisted?).to be false
      end
    end

    describe '.build_stubbed' do
      it 'should not create a Country' do
        expect { build_stubbed(:country) }.not_to change { Country.count }
      end
    end

    describe '.create' do
      it 'should create a Country' do
        expect { create(:country) }.to change { Country.count }.by(1)
      end

      it 'should return a persisted instance' do
        country = create(:country)
        expect(country.id).to be_a Integer
        expect(country.created_at).to be_a Time
        expect(country.updated_at).to be_a Time
        expect(country.persisted?).to be true
      end

      it 'should create same Country only once' do
        expect do
          3.times { create(:country) }
        end.to change { Country.count }.by(1)
      end

      it 'should return same Country on subsequent create' do
        first_country = create(:country)
        3.times do
          yet_another_country = create(:country)
          expect(yet_another_country).to eq(first_country)
        end
      end
    end
  end
end
