require 'pry'
require './lib/pantry'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

describe CookBook do
  before :each do
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook = CookBook.new
  end
  it "exists" do
    expect(@cookbook).to be_a CookBook
  end
  it "starts with an empty array of recipes" do
    expect(@cookbook.recipes).to eq([])
  end
  it "can add recipes" do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.recipes.length).to eq(2)
    expect(@cookbook.recipes[0]).to be_a Recipe
    expect(@cookbook.recipes[0]).to eq(@recipe1)
  end
  it "can return an array of ingredient names" do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
  end
  it "can return the highest calorie recipe" do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.highest_calorie_meal).to be_a Recipe
    expect(@cookbook.highest_calorie_meal).to eq(@recipe2)
  end
  it "can set it's date created" do
    expect(@cookbook.date_created).to eq("06-14-2022")
  end
end
