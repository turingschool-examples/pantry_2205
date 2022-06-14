require './lib/helper'

RSpec.decribe Recipie do

  before do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

    @recipe1 = Recipe.new("Mac and Cheese")
  end

  it 'can name recipe' do
    expect(@recipe1.name).to eq("Mac and Cheese")
  end

  xit 'can return empty hash of required ingredients'do
    expect(@recipe1.ingredients_required).to eq({})
  end

  xit 'can add required ingredients to hash and return hash' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)

    # recipe1.ingredients_required
    # # => {#<Ingredient:0x00007fd7811553c8...> => 6, #<Ingredient:0x00007fd78110b0e8...> => 8}
    #
    # recipe1.ingredients
    # # => [#<Ingredient:0x007fe8438c7a70...>, #<Ingredient:0x007fe843857f40...>]



  end



end
