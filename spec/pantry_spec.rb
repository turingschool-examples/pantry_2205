require './lib/pantry'
require './lib/ingredient'

RSpec.describe Pantry do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry = Pantry.new
  end

  it 'exists' do
    expect(@pantry).to be_a(Pantry)
  end

  it "can stock, restock, and stock check ingredients" do
    @pantry.stock #=> {}
    # @pantry.stock_check(@ingredient1) #=> 0
    @pantry.restock(@ingredient1, 5)
    # @pantry.restock(@ingredient2, 7)
    # require 'pry' ; binding.pry

    expect(@pantry.stock_check(@ingredient1)).to eq(5)
    # expect(@pantry.stock_check(@ingredient2)).to eq(7)
  end
end
