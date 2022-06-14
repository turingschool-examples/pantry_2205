require './lib/cookbook'

RSpec.describe CookBook do
  before :each do
    @cookbook = CookBook.new
    @ingredient1 = Ingredient.new({name: 'Cheese', unit: 'C', calories: 100})
    @ingredient2 = Ingredient.new({name: 'Macaroni', unit: 'oz', calories: 30})
    @recipe1 = Recipe.new('Mac and Cheese')
    @recipe2 = Recipe.new("Cheese Burger")
  end

  describe '#initialize' do
    it 'is a Cookbook' do
      expect(@cookbook).to be_a CookBook
    end

    it 'initializes with an empty array of recipes' do
      expect(@cookbook.recipes).to eq []
    end
  end

  describe '#add_recipe' do
    it 'can add recipes to a cookbook' do
      @cookbook.add_recipe(@recipe1)
      expect(@cookbook.recipes).to eq [@recipe1]
      @cookbook.add_recipe(@recipe2)
      expect(@cookbook.recipes).to eq [@recipe1, @recipe2]
    end
  end
end
