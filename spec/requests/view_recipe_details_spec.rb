
require 'rails_helper'

context 'Recipes API' do
  feature 'GET /api/v1/recipes/:id' do
    scenario 'returns the recipe details' do
      user = create :user, role: :admin
      recipe = create :recipe, user: user

      get api_v1_recipe_path recipe

      expect(response).to have_http_status :ok
      expect(response.content_type).to include 'application/json'

      json_response = JSON.parse response.body

      expect(json_response['title']).to eq recipe.title
      expect(json_response['email']).to eq user.email
      expect(json_response['cook_time']).to eq recipe.cook_time
      expect(json_response['ingredients']).to eq recipe.ingredients
      expect(json_response['instructions']).to eq recipe.instructions
    end
  end
end
