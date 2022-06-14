require './lib/ingredient'
require './lib/pantry'
RSpec.describe Ingredient do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  it 'exists' do
    expect(@ingredient1).to be_a(Ingredient)
    expect(@ingredient2).to be_a(Ingredient)
  end
