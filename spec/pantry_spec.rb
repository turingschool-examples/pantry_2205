require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

RSpec.describe Pantry do
  before(:each) do
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  it 'exists' do
    expect(@pantry).to be_a(Pantry)
  end

  it 'has no stock by default' do
    expect(@pantry.stock).to eql({})
  end

  it 'checks the stock for an ingredient' do
    expect(@pantry.stock_check(@ingredient1)).to eql(0)
  end

  it 'checks the stock for an ingredient after restocking' do
    expect(@pantry.stock_check(@ingredient1)).to eql(0)
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    expect(@pantry.stock_check(@ingredient1)).to eql(15)
    @pantry.restock(@ingredient2, 7)
    expect(@pantry.stock_check(@ingredient2)).to eql(7)
  end

  it 'checks to see if it has enough ingredients for the recipe' do
    @pantry1 = Pantry.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @ingredient11 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient12 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1.add_ingredient(@ingredient11, 2)
    @recipe1.add_ingredient(@ingredient12, 8)
    @ingredient13 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100 })
    @ingredient14 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe2 = Recipe.new("Cheese Burger")
    @recipe2.add_ingredient(@ingredient11, 2)
    @recipe2.add_ingredient(@ingredient13, 4)
    @recipe2.add_ingredient(@ingredient14, 1)
    @pantry1.restock(@ingredient11, 5)
    @pantry1.restock(@ingredient11, 10)
    expect(@pantry1.enough_ingredients_for?(@recipe1)).to eql(false)
    @pantry1.restock(@ingredient12, 7)
    expect(@pantry1.enough_ingredients_for?(@recipe1)).to eql(false)
    @pantry1.restock(@ingredient12, 1)
    expect(@pantry1.enough_ingredients_for?(@recipe1)).to eql(true)
  end


end
