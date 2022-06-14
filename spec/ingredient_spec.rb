require './lib/ingredient'

RSpec.describe Ingredient do
  it 'exists' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    expect(ingredient1).to be_a(Ingredient)
  end

end
