require './lib/ingredient'
require './lib/pantry'

RSpec.describe Pantry do
  before :each do
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
  end

  it 'exists' do
    expect(@pantry).to be_a(Pantry)
  end

  it 'has an empty stock' do
    expect(@pantry.stock).to eq({})
  end

  it 'can check the stock' do
    expect(@pantry.stock_check(@ingredient1)).to eq(0)
  end

  it 'can restock the pantry' do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    @pantry.restock(@ingredient2, 7)
    expect(@pantry.stock_check(@ingredient1)).to eq(15)
    expect(@pantry.stock_check(@ingredient2)).to eq(7)
  end

end
