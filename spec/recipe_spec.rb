require './lib/ingredient'
require './lib/recipe'

RSpec.describe Recipe do
  it 'exists' do
    recipe1 = Recipe.new("Mac and Cheese")
    expect(recipe1).to be_a(Recipe)
  end
end
