require 'rspec'
require './lib/ingredient'

RSpec.describe Ingredient do

  before(:each) do
    @ingredient1 = Ingredient.new({
      name: "Cheese",
      unit: "oz",
      calories: 50})
  end

  it 'exists' do
    expect(@ingredient1).to be_instance_of(Ingredient)
  end

  it 'returns name' do
    expect(@ingredient1.name).to eq("Cheese")
  end

  it 'returns unit' do
    expect(@ingredient1.unit).to eq("oz")
  end

  it 'returns calories' do
    expect(@ingredient1.calories).to eq(50)
  end

end
