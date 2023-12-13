
require 'rails_helper'

feature 'User visit the categories index page' do
  scenario 'from the home page' do
    visit root_path

    click_on 'Categorias de Receitas'

    expect(current_path).to eq categories_path
  end
end
