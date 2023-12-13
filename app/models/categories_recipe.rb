class CategoriesRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :category

  validates_uniqueness_of :category, scope: :recipe
end
