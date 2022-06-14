require './lib/ingredient'
require './lib/pantry'

describe Pantry do
  before(:each) do
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  it "has no stock by default" do
    expect(@pantry.stock).to eq({})
  end

  it "ingredients have 0 stock by default" do
    expect(@pantry.stock_check(@ingredient1)).to eq(0)
  end

  it "can stock ingredients" do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    expect(@pantry.stock_check(@ingredient1)).to eq(15)
  end

end
