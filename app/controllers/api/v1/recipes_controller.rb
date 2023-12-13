
class Api::V1::RecipesController < ActionController::API
  def show
    recipe = Recipe.find params[:id]
    recipe_json = recipe.as_json only: %i[title ingredients cook_time instructions]
    recipe_json['email'] = recipe.user.email

    render status: :ok, json: recipe_json
  end
end
