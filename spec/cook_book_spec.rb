require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'
require './lib/pantry'

RSpec.describe CookBook do
  before :each do
    @cookbook = CookBook.new
    @recipe2 = Recipe.new("Cheese Burger")
    @recipe1 = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @pantry = Pantry.new
  end

  it "exists" do
    expect(@cookbook).to be_instance_of(CookBook)
  end

  it "gives an array of recipes" do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
  end

  it "gives an array of ingredients" do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @pantry.restock(@ingredient1, 10)
    @pantry.restock(@ingredient2, 10)
    @pantry.restock(@ingredient3, 10)
    @pantry.restock(@ingredient4, 10)

    expect(@cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
  end

  it "has a highest calorie meal" do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @pantry.restock(@ingredient1, 10)
    @pantry.restock(@ingredient2, 10)
    @pantry.restock(@ingredient3, 10)
    @pantry.restock(@ingredient4, 10)

    expect(@cookbook.highest_calorie_meal).to eq(@recipe2)
  end
end
