
require 'rails_helper'

feature 'User visit the category creation page' do
  context 'when logged in as admin' do
    scenario 'from the home page' do
      user = create :user, role: :admin

      login_as user, scope: :user

      visit root_path

      click_on 'Categorias de Receitas'
      click_on 'Cadastrar Nova Categoria'

      expect(current_path).to eq new_category_path
    end

    scenario 'and sees the registration form' do
      user = create :user, role: :admin

      login_as user, scope: :user

      visit new_category_path

      expect(page).to have_field 'Nome'
    end

    scenario 'and creates a category successfully' do
      user = create :user, role: :admin

      login_as user, scope: :user

      visit new_category_path

      fill_in 'Nome', with: 'Junina'

      click_on 'Criar Categoria de Receitas'

      expect(current_path).to eq categories_path
      expect(page).to have_content 'Categoria cadastrada com sucesso'
      expect(page).to have_content 'Junina'
    end
  end

  context 'when not logged' do
    scenario 'gets redirected to the login page' do
      visit new_category_path

      expect(current_path).to eq new_user_session_path
    end
  end
end
