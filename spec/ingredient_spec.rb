require './lib/helper'

RSpec.describe Ingredient do

  it 'can return name' do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    expect(@ingredient1.name).to eq("Cheese")
  end

  it 'can return unit of measure' do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
        expect(@ingredient1.unit).to eq("oz")
  end

  it 'can return calories' do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    expect(@ingredient1.calories).to eq(50)
  end

end
