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

  it 'has a name' do
    expect(@pantry.stock).to eql({})
  end


end
