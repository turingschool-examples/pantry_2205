require './lib/ingredient'

RSpec.describe Ingredient do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
  end

  it 'is an instance of an ingredient' do
    expect(@ingredient1).to be_a Ingredient
  end

  it 'has a name' do
    expect(@ingredient1.name).to eq "Cheese"
  end

  it 'has a unit' do
    expect(@ingredient1.unit).to eq "oz"
  end

  it 'has calories' do
    expect(@ingredient1.calories).to eq 50
  end


end
