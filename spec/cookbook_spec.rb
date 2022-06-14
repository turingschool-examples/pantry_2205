require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cookbook'

RSpec.describe CookBook do
  before(:each) do
    @cookbook = CookBook.new
    @recipe6 = Recipe.new("Cheeseburger in Paradise")
    @recipe7 = Recipe.new("Potatoes")
  end

  it 'exists' do
    expect(@cookbook).to be_a(CookBook)
  end

  it 'has no recipes by default' do
    expect(@cookbook.recipes).to eql([])
  end

  it 'adds two recipes' do
    @cookbook.add_recipe(@recipe6)
    @cookbook.add_recipe(@recipe7)
    expect(@cookbook.recipes).to eql([@recipe6, @recipe7])
  end

end
