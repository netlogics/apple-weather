require 'rails_helper'

RSpec.describe Weather, type: :model do
  describe '.validates' do
    context 'required fields' do
      subject(:weather) { build :weather }

      it 'requires address' do
        expect(subject).to be_valid
        subject.address = nil
        expect(subject).not_to be_valid
      end

      it 'requires forecast' do
        expect(subject).to be_valid
        subject.forecast = nil
        expect(subject).not_to be_valid
      end
    end
  end
end
