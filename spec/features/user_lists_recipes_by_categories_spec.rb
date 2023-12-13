
require 'rails_helper'

feature 'User visits the recipes by categories' do
  scenario 'and sees no recipes for the given category' do
    user = create :user, role: :admin
    recipe_type = create :recipe_type

    first_category = Category.create! name: 'Junina', user: user
    second_category = Category.create! name: 'Natal', user: user

    first_recipe = create :recipe, title: 'Bolo de Fubá'
    second_recipe = create :recipe, title: 'Peru Assado'

    CategoriesRecipe.create category: first_category, recipe: first_recipe

    visit root_path

    click_on 'Categorias de Receitas'

    click_on 'Natal'

    expect(page).to have_content 'Nenhuma Receita Encontrada'
  end

  scenario 'and sees all recipes from a given category' do
    user = create :user, role: :admin

    recipe_type = create :recipe_type

    first_category = Category.create! name: 'Junina', user: user
    second_category = Category.create! name: 'Natal', user: user

    first_recipe = create :recipe, title: 'Bolo de Fubá'
    second_recipe = create :recipe, title: 'Peru Assado'

    CategoriesRecipe.create category: first_category, recipe: first_recipe

    visit root_path

    click_on 'Categorias de Receitas'

    click_on 'Junina'

    expect(page).to have_content 'Bolo de Fubá'
    expect(page).not_to have_content 'Peru Assado'
  end
end
