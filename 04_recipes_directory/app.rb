require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

DatabaseConnection.connect('recipes_directory')

recipe_repo = RecipeRepository.new

recipe_repo.all.each do |recipe|
  p recipe
end

recipe_repo.find(1).each do |recipe|
  p recipe.cooking_time
end