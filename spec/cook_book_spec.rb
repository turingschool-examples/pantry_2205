require './lib/cook_book'

RSpec.describe CookBook do
  before :each do
    @cookbook = CookBook.new
    @ingredient1 = Ingredient.new({name: 'Cheese', unit: 'C', calories: 100})
    @ingredient2 = Ingredient.new({name: 'Macaroni', unit: 'oz', calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new('Mac and Cheese')
    @recipe2 = Recipe.new("Cheese Burger")
    @recipe3 = Recipe.new("Test Recipe")
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

  describe '#ingredients' do
    it 'returns an array of all ingredient names within recipes in a cookbook' do
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)
      @recipe2.add_ingredient(@ingredient1, 2)
      @recipe2.add_ingredient(@ingredient3, 4)
      @recipe2.add_ingredient(@ingredient4, 1)
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)
      expected_array = ['Cheese', 'Macaroni', 'Ground Beef', 'Bun']
      expect(@cookbook.ingredients).to eq expected_array
    end
  end

  describe '#highest_calorie_meal' do
    it 'returns the meal with the highest calories' do
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)
      @recipe2.add_ingredient(@ingredient1, 2)
      @recipe2.add_ingredient(@ingredient3, 4)
      @recipe2.add_ingredient(@ingredient4, 1)
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)
      expect(@cookbook.highest_calorie_meal).to eq @recipe2
    end
  end

  # I don't think I'll finish this one
  # Nope didn't finish this one.
  # describe '#summary' do
  #   it 'works' do
  #     @cookbook = CookBook.new
  #     @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
  #     @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
  #     @recipe1 = Recipe.new("Mac and Cheese")
  #     @recipe1.add_ingredient(@ingredient1, 2)
  #     @recipe1.add_ingredient(@ingredient2, 8)
  #     @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
  #     @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 1})
  #     @recipe2 = Recipe.new("Burger")
  #     @recipe2.add_ingredient(@ingredient3, 4)
  #     @recipe2.add_ingredient(@ingredient4, 100)
  #     @cookbook.add_recipe(@recipe1)
  #     @cookbook.add_recipe(@recipe2)
  #     expect(@cookbook.summary).to eq []
  #   end
  # end

  describe '#date' do
    it 'stores the date that a CookBook was created' do
      expect(@cookbook.date).to be_a String
    end
  end
end
