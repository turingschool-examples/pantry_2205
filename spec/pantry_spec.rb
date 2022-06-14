require './lib/pantry'
require './lib/ingredient'

RSpec.describe Pantry do
  before :each do
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  it "exists" do
    expect(@pantry).to be_a(Pantry)
  end

  it "starts with an empty hash stock" do
    expect(@pantry.stock).to eq({})
  end

  it "can check stock" do
    expect(@pantry.stock_check(@ingredient1)).to eq(0)
  end

  it "can restock" do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    @pantry.restock(@ingredient2, 7)

    expect(@pantry.stock_check(@ingredient1)).to eq(15)
    expect(@pantry.stock_check(@ingredient2)).to eq(7)
  end

  it "can restock enough_ingredients_for?" do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)

    @pantry.restock(@ingredient2, 7)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)

    @pantry.restock(@ingredient2, 1)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(true)
  end
end
