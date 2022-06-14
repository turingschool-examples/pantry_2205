require './lib/ingredient'
require './lib/recipe'
# require './lib/cook_book'

RSpec.describe Recipe do
  it 'exists' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    # @recipe1.name = "Mac and Cheese"
    recipe1 = Recipe.new("Mac and Cheese")
    expect(recipe1).to be_instance_of(Recipe)
  end

  it 'has required ingredients' do
    # expect(@recipe1.ingredients_required).to eq{}
    expect(@recipe1.ingredients).to eq(Ingredients)
    expect(@recipe1.add_ingredients).to eq(ingredient1, 2)
    expect(recipe1.add_ingredients).to eq(ingredient1, 4)
    expect(recipe1.add_ingredients).to eq(ingredient2, 8)

  end

end
