require 'rails_helper'

RSpec.describe CategoriesRecipe, type: :model do
  describe '#valid?' do
    context 'uniqueness' do
      it 'should be invalid when same values are used' do
        category = create :category
        recipe = create :recipe

        CategoriesRecipe.create! category: category, recipe: recipe
        categoryRecipe = CategoriesRecipe.new category: category, recipe: recipe

        expect(categoryRecipe).not_to be_valid
      end
    end
  end
end
