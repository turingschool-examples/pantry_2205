require './lib/ingredient'
require './lib/pantry'

RSpec.describe Pantry do
  it "exists" do
    @pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    expect(@pantry).to be_instance_of(Pantry)
  end

  it "has an empty hash for stock" do
    @pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    expect(@pantry.stock).to eq{0}
    expect(@pantry.stock_check).to eq(0)
    require 'pry'; binding.pry
  end

  it "can restock" do
    @pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    expect(@pantry_restock).to eq(@ingredient1, 5)
    expect(@pantry_restock).to eq(@ingredient1, 10)
  end
  # it "has no stock check" do
  #   @pantry = Pantry.new
  # end
end
