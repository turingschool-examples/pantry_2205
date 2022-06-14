require './lib/pantry'
require './lib/ingredient'
require './lib/cook_book'
require './lib/recipe'

RSpec.describe Pantry do
  before :each do
    @pantry = Pantry.new
    @cookbook = CookBook.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
  end

  it "exists with an empty stock" do
    expect(@pantry).to be_instance_of(Pantry)
    expect(@pantry.stock).to eq({})
  end

  it "can check how many items are in stock" do
    expect(@pantry.stock_check(@ingredient1)).to eq(0)
  end

  it "can restock items" do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    expect(@pantry.stock_check(@ingredient1)).to eq(15)

    @pantry.restock(@ingredient2, 7)

    expect(@pantry.stock_check(@ingredient2)).to eq(7)
  end

  it "checks if it has enough ingredients" do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)

    @pantry.restock(@ingredient2, 7)

    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)

    @pantry.restock(@ingredient2, 1)

    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(true)
  end
end
