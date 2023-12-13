class CreateCategoriesRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_recipes do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :categories_recipes, [:recipe_id, :category_id], unique: true
  end
end
