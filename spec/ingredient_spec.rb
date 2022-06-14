require './lib/ingredient'
require 'rspec'
require 'pry'

RSpec.describe Ingredient do
  before(:each) do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  it "exist" do
    expect(@ingredient1).to be_a(Ingredient)

  end

  it "ingredient has attributes" do
    expect(@ingredient1.name).to eq("Cheese")
    expect(@ingredient1.unit).to eq("oz")
    expect(@ingredient1.calories).to eq(50)
    expect(@ingredient2.name).to eq("Macaroni")
    expect(@ingredient2.unit).to eq("oz")
    expect(@ingredient2.calories).to eq(200)
  end

end
