require './lib/ingredient'

RSpec.describe Ingredient do

  let(:ingredient1) { Ingredient.new({name: "Cheese", unit: "oz", calories: 50}) }
  let(:ingredient2) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 200}) }

  it "exists" do
    expect(ingredient1).to be_a(Ingredient)
    expect(ingredient2).to be_a(Ingredient)
  end

  it "has attributes" do
    expect(ingredient1.name).to eq("Cheese")
    expect(ingredient2.name).to eq("Macaroni")
    expect(ingredient1.unit).to eq("oz")
    expect(ingredient1.calories).to eq(50)
  end
end
