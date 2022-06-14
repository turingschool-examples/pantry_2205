require './lib/pantry'
require './lib/ingredient'
require 'rspec'
require 'pry'

RSpec.describe Pantry do
  before(:each) do
    @pantry = Pantry.new

  it "exist" do
    expect(@pantry).to be_a(Pantry)
  end

  it "pantry has a default empty hash for stock" do
    expect(@pantry.stock).to eq({})
  end

  it "can check stock in pantry" do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    expect(@pantry.stock_check(ingredient1)).to eq(0)
  end

  it "can restock items in pantry" do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @pantry.restock(ingredient1, 5)
    @pantry.restock(ingredient1, 10)
    expect(@pantry.stock_check(ingredient1)).to eq(15)

    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry.restock(ingredient2, 7)
    expect(@pantry.stock_check(ingredient2)).to eq(7)
  end


end
