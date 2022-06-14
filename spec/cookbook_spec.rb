require './lib/ingredient'
require './lib/recipe'
require './lib/cookbook'

RSpec.describe CookBook do
  before :each do
    @cookbook = CookBook.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  it 'exists' do
    expect(@cookbook).to be_a(CookBook)
  end

  it 'can add recipes and put them in an array' do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expect(@cookbook.recipes). to eq([@recipe1, @recipe2])
  end

end
