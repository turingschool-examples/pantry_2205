require './lib/pantry'
require './lib/ingredient'

RSpec.describe Pantry do
  before :each do
    @pantry= Pantry.new
  end

  it 'exists' do
    expect(@pantry).to be_a(Pantry)
  end
  it 'has a stock set to an empty hash' do
    expect(@pantry.stock).to eq({})
  end

  it 'can check stock and restock ingredients' do
    expect(@pantry.stock_check(@ingredient1)).to eq(0)
    @pantry.restock(@ingredient1, 5)
    expect(@pantry.stock).to eq({@ingredient1 => 5})
    expect(@pantry.stock_check(@ingredient1)).to eq(5)
    @pantry.restock(@ingredient1, 10)
    expect(@pantry.stock_check(@ingredient1)).to eq(15)
  end

  it 'can restock other items' do
    @pantry.restock(@ingredient2, 7)
    expect(@pantry.stock_check(@ingredient2)).to eq(7)
  end

  
end
