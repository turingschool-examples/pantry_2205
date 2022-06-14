require './lib/ingredient'
require './lib/pantry'
require './recipe'


RSpec.describe Pantry do
  it 'exists and has attributes' do
    pantry = Pantry.new
    expect(pantry).to be_a Pantry
  end

  it 'has no stock initially' do
    pantry = Pantry.new
    expect(pantry.stock).to be_a Hash
  end

  it 'has a stock check' do
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    expect(pantry.stock_check(ingredient1)).to eq 0
  end

  it 'can restock' do
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    expect(pantry.stock_check).to eq 15
    pantry.restock(ingredient2, 7)
    expect(pantry.stock_check).to eq 7
  end
  it "checks for enough ingredients" do
    pantry = Pantry.new
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)
    pantry.restock(ingredient2, 7)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)
    pantry.restock(ingredient2, 1)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(true)
  end
end
