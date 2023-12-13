class Category < ApplicationRecord
  belongs_to :user
  has_many :categories_recipe
  has_many :recipes, through: :categories_recipe

  validates_presence_of :name
  validates_uniqueness_of :name
end
