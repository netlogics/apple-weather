require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '.validates' do
    context 'required fields' do
      subject(:address) { build :address }

      it 'requires city' do
        expect(subject).to be_valid
        subject.city = nil
        expect(subject).not_to be_valid
      end

      it 'requires state' do
        expect(subject).to be_valid
        subject.state = nil
        expect(subject).not_to be_valid
      end

      it 'requires zip' do
        expect(subject).to be_valid
        subject.zip = nil
        expect(subject).not_to be_valid
      end
    end
  end
end
