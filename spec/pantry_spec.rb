require 'ingredient'
require 'pantry'

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


end
