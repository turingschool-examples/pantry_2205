require 'rspec'
require './lib/ingredient'

RSpec.describe Ingredient do

  before(:each) do
    @ingredient1 = Ingredient.new({
      name: "Cheese",
      unit: "oz",
      calories: 50})
  end

  it 'exists' do
    expect(@ingredient1).to be_instance_of(Ingredient)
  end

end
