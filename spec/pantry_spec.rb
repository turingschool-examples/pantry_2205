require './lib/ingredient'
require './lib/pantry'

RSpec.describe Pantry do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry = Pantry.new
  end

  it 'exists' do
    expect(@pantry).to be_a(Pantry)
  end

  it 'returns the empty stock' do
    expect(@pantry.stock).to eq({})
  end

  it 'can check the stock of ingredients' do
    expect(@pantry.check_stock(@ingredient1)).to eq(0)
  end

  it 'can restock the ingredients' do
    expect(@pantry.check_stock(@ingredient1)).to eq(0)
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    expect(@pantry.check_stock(@ingredient1)).to eq(15)
    @pantry.restock(@ingredient2, 7)
    expect(@pantry.check_stock(@ingredient2)).to eq(7)
  end
end
