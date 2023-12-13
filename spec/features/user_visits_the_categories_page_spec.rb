
require 'rails_helper'

feature 'User visit the categories index page' do
  scenario 'from the home page' do
    visit root_path

    click_on 'Categorias de Receitas'

    expect(current_path).to eq categories_path
  end

  scenario 'and sees existing categories' do
    user = create :user, role: :admin
    Category.create! user: user, name: 'Natal'
    Category.create! user: user, name: 'Páscoa'

    visit categories_path

    expect(page).to have_content 'Natal'
    expect(page).to have_content 'Páscoa'
  end

  scenario 'and sees no existing categories' do
    visit categories_path

    expect(page).to have_content 'Nenhuma Categoria Encontrada'
  end
end
