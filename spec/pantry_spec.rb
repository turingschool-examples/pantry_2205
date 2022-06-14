require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

RSpec.describe Pantry do
  before :each do
    @pantry = Pantry.new

  end

  it "exists" do
    expect(@pantry).to be_a(Pantry)
  end

  it "has a stock, empty to start" do
    expect(@pantry.stock).to eq({})
  end

  it "can check the stock of an ingredient" do
    expect(@pantry.stock_check(@ingredient1)).to eq(0)
  end

  it "can restock ingredients" do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    expect(@pantry.stock_check(@ingredient1)).to eq(15)
  end

  it "can restock more ingredients" do
    @pantry.restock(@ingredient2, 7)

    expect(@pantry.stock_check(@ingredient2)).to eq(7)
  end

  it "knows if it is has enough ingredients for a given recipe" do
    @recipe1 = Recipe.new("Mac and Cheese")
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)

    @pantry.restock(@ingredient2, 7)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)

    @pantry.restock(@ingredient2, 1)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(true)
  end
end
