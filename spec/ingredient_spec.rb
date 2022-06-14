require './lib/ingredient'

RSpec.describe Ingredient do
  before :each do
    @ingredient1 = Ingredient.new({name:
   "Cheese", unit: "oz", calories: 50})

  end

  it 'exists & has attributes' do
    expect(@ingredient1).to be_a(Ingredient)
    expect(@ingredient1.name).to eq("Cheese")
    expect(@ingredient1.unit).to eq("oz")
    expect(@ingredient1.calories).to eq(50)
    # require 'pry' ; binding.pry
  end
end
