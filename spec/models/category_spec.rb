require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'shoud be invalid when name is empty' do
        user = create :user, role: :admin
        category = Category.new name: '', user: user

        expect(category).not_to be_valid
      end
    end

    context 'uniqueness' do
      it 'should be invalid when name is already in use' do
        user = create :user, role: :admin
        Category.create! name: 'Páscoa', user: user

        category = Category.new name: 'Páscoa', user: user

        expect(category).not_to be_valid
      end
    end
  end
end
