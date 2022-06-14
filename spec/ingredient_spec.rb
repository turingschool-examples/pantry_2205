require './lib/ingredient'

RSpec.describe Ingredient do
  before do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  it 'exists & has attributes' do
    expect(@ingredient1).to be_a(Ingredient)
    expect(@ingredient1.unit).to eq("oz")
    expect(@ingredient1.calories).to eq(50)
    expect(@ingredient2.name).to eq("Macaroni")
  end
end