if @recipes.present?
  json.recipes @recipes do |recipe|
    json.id recipe.id
    json.created_at recipe.created_at
    json.updated_at recipe.updated_at
    json.title recipe.title
    json.descriptions recipe.descriptions
    json.time recipe.time
    json.difficulty recipe.difficulty
    json.category_id recipe.category_id

    json.ingredients recipe.ingredients do |ingredient|
      json.id ingredient.id
      json.created_at ingredient.created_at
      json.updated_at ingredient.updated_at
      json.unit ingredient.unit
      json.amount ingredient.amount
      json.recipe_id ingredient.recipe_id
    end

    json.user_id recipe.user_id
  end
else
  json.error_message @error_message
end
