require 'rspec'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'
require 'pry'

RSpec.describe Pantry do

  before(:each) do
    @ingredient1 = Ingredient.new({
      name: "Cheese",
      unit: "oz",
      calories: 100})

    @ingredient2 = Ingredient.new({
      name: "Macaroni",
      unit: "oz",
      calories: 30})

    @ingredient3 = Ingredient.new({
      name: "Ground Beef",
      unit: "oz",
      calories: 100})

    @ingredient4 = Ingredient.new({
      name: "Bun",
      unit: "g",
      calories: 75})

    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")

    @pantry = Pantry.new
  end

  it 'exists' do
    expect(@pantry).to be_instance_of(Pantry)
  end

  it 'initializes with empty stock hash' do
    expect(@pantry.stock).to eq({})
  end

  it 'can check ingredient stocks' do
    expect(@pantry.stock_check(@ingredient1)).to eq(0)
  end

  it 'can restock ingredients' do
    @pantry.restock(@ingredient1,5)
    @pantry.restock(@ingredient1,10)
    @pantry.restock(@ingredient2,7)

    expect(@pantry.stock_check(@ingredient1)).to eq(15)
    expect(@pantry.stock_check(@ingredient2)).to eq(7)
  end

  it 'checks if enough ingredients for given recipe' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)

    @pantry.restock(@ingredient1,5)
    @pantry.restock(@ingredient1,10)

    expect(@pantry.enough_ingredients_for?(@recipe1)).to be false

    @pantry.restock(@ingredient2, 7)

    expect(@pantry.enough_ingredients_for?(@recipe1)).to be false

    @pantry.restock(@ingredient2, 1)

    expect(@pantry.enough_ingredients_for?(@recipe1)).to be true
  end

end
