require './lib/ingredient'

RSpec.describe Ingredient do
  before(:each) do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
  end

  it 'exists' do
    expect(@ingredient1).to be_a(Ingredient)
  end

  it 'has a name' do
    expect(@ingredient1.name).to eql("Cheese")
  end

  it 'has a unit' do
    expect(@ingredient1.unit).to eql("oz")
  end

  it 'has calories' do
    expect(@ingredient1.calories).to eql(50)
  end

end
