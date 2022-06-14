require './lib/ingredient'
require './lib/recipe'

RSpec.describe Recipe do
  it 'exists' do
    recipe1 = Recipe.new("Mac and Cheese")
    expect(recipe1).to be_a(Recipe)
  end

  it 'has attributes' do
    recipe1 = Recipe.new("Mac and Cheese")
    expect(recipe1.name).to eq("Mac and Cheese")
    expect(recipe1.ingredients_required).to eq({})
  end
end
