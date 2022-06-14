require 'rspec'
require './lib/ingredient'

RSpec.describe Ingredient do
  it 'exists' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    expect(ingredient1).to be_a(Ingredient)
  end

  it 'has attributes' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient1.name
    expect(ingredient1.name).to eq("Cheese")

    ingredient1.unit
    expect(ingredient1.unit).to eq("oz")

    ingredient1.calories
    expect(ingredient1.calories).to eq(50)
  end
end
