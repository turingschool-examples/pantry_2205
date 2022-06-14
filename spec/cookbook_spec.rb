require './lib/recipe'
require './lib/cookbook'
require './lib/pantry'
require './lib/ingredient'
require 'date'

RSpec.describe CookBook do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

    @pantry = Pantry.new

    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")




    @cookbook = CookBook.new
  end

  it 'is an instance of a cookbook' do
    expect(@cookbook).to be_a CookBook
  end

  it 'has no recipies by default' do
    expect(@cookbook.recipes).to eq []
  end

  it 'can add recipes' do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expect(@cookbook.recipes).to eq [@recipe1, @recipe2]
  end

  it 'knows all ingredients' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)

    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expect(@cookbook.ingredients).to eq [@ingredient1, @ingredient2, @ingredient3, @ingredient4]
  end

  it 'knows the highest calorie meal' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)

    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expect(@cookbook.highest_calorie_meal).to eq @recipe2
  end

  xit 'has a summary' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 100)

    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expect(@cookbook.summary).to eq []
  end

  it 'has a created date' do
    expect(@cookbook.date).to eq Date.today
  end

end
