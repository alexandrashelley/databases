require_relative 'recipe'

class RecipeRepository
  def all
    sql = 'SELECT * FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])

    recipes = []

    result_set.each do |column|
      recipe = Recipe.new
      recipe.id = column['id']
      recipe.name = column['name']
      recipe.cooking_time = column['cooking_time']
      recipe.rating = column['rating']

      recipes << recipe

    end
      return recipes
  end

  def find(id)
    sql = 'SELECT * FROM recipes WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)

    a_recipe = []

    result_set.find(1).each do |column|
      recipe = Recipe.new
      recipe.id = column['id']
      recipe.name = column['name']
      recipe.cooking_time = column['cooking_time']
      recipe.rating = column['rating']

      a_recipe << recipe
    end
      return a_recipe
    end
end



