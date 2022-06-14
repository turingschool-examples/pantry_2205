require './lib/recipe'

RSpec.describe Recipe do
  before :each do
    @ingredient1 = Ingredient.new({name: 'Cheese', unit: 'C', calories: 100})
    @ingredient2 = Ingredient.new({name: 'Macaroni', unit: 'oz', calories: 30})
    @recipe1 = Recipe.new('Mac and Cheese')
  end

  describe '#initialize' do
    it 'is a Recipe' do
      expect(@recipe1).to be_a Recipe
    end

    it 'has a name' do
      expect(@recipe1.name).to eq 'Mac and Cheese'
    end

    it 'has an empty hash of ingredients required' do
      expect(@recipe1.ingredients_required).to eq ({})
    end
  end
end
