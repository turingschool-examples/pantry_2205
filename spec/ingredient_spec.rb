require 'ingredient'

RSpec.describe Ingredient
  before(:each) do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
  end

end
