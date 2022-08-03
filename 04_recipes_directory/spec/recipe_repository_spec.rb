require 'recipe_repository'

RSpec.describe RecipeRepository do

def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end
  
    before(:each) do
      reset_recipes_table
    end

  it 'retrieves all recipes' do
    repo = RecipeRepository.new

    recipes = repo.all

    expect(recipes.length).to eq 2

    expect(recipes.first.id).to eq  '1'
    expect(recipes.first.name).to eq  'Bang Bang Cauliflower'
    expect(recipes.first.cooking_time).to eq  '60'
    expect(recipes.first.rating).to eq '4'

    expect(recipes.last.id).to eq  '2'
    expect(recipes.last.name).to eq  'Tofu Rolls' 
    expect(recipes.last.cooking_time).to eq  '40'
    expect(recipes.last.rating).to eq '5'
  end

  it 'retrieves one recipe when given an id' do
    repo = RecipeRepository.new

    recipe = repo.find(1)

    expect(recipe[0].id).to eq  '1'
    expect(recipe[0].name).to eq  'Bang Bang Cauliflower'
    expect(recipe[0].cooking_time).to eq  '60'
    expect(recipe[0].rating).to eq '4'
  end
end
