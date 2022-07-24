require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) do
    create(:rating)
  end

  describe 'Assocations' do
    it { is_expected.to belong_to(:recipe) }

    it { is_expected.to belong_to(:user) }
  end

  describe 'Valid subject' do
    it 'is valid recipe' do
      expect(rating).to be_valid
    end
  end

  describe 'Invalid Score validations' do
    it 'is invalid max length' do
      rating.score = 6
      expect(rating).not_to be_valid
    end
  end

  describe 'Validate presence' do
    it { is_expected.to validate_presence_of(:score) }
  end
end

