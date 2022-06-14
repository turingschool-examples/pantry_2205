require './lib/recipe'

RSpec.describe Recipe do
  before :each do
    @ingredient1 = Ingredient.new({name: 'Cheese', unit: 'C', calories: 100})
    @ingredient2 = Ingredient.new({name: 'Macaroni', unit: 'oz', calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new('Mac and Cheese')
    @recipe2 = Recipe.new("Cheese Burger")
    @recipe3 = Recipe.new("Test Recipe")
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

  describe '#add_ingredient' do
    it 'can add necessary Ingredient objects to a recipe' do
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient1, 4)
      @recipe1.add_ingredient(@ingredient2, 8)
      expected_hash = { @ingredient1 => 6, @ingredient2 => 8 }
      expect(@recipe1.ingredients_required).to eq expected_hash
    end
  end

  describe '#ingredients' do
    it 'can return an array of the Ingredient objects in ingredients_required' do
      @recipe1.add_ingredient(@ingredient1, 2)
      expect(@recipe1.ingredients).to eq [@ingredient1]
      @recipe1.add_ingredient(@ingredient2, 8)
      expect(@recipe1.ingredients).to eq [@ingredient1, @ingredient2]
    end
  end

  describe '#total_calories' do
    it 'can return an integer of the count of calories in a recipe' do
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)
      expect(@recipe1.total_calories).to eq 440
      @recipe2.add_ingredient(@ingredient1, 2)
      @recipe2.add_ingredient(@ingredient3, 4)
      @recipe2.add_ingredient(@ingredient4, 1)
      expect(@recipe2.total_calories).to eq 675
      expect(@recipe3.total_calories).to eq 0
    end
  end
end
