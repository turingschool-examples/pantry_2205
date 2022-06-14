require './lib/ingredient'
require 'rspec'

RSpec.describe Ingredient do

  it "exists" do
    ingredient = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    expect(ingredient).to be_instance_of(Ingredient)
  end

  it "can return an ingredient's qualities" do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    expect(ingredient1.name).to eq("Cheese")
    expect(ingredient1.unit).to eq("oz")
    expect(ingredient1.calories).to eq(50)
  end
  
end
