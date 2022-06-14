require './lib/ingredient'
require './lib/recipe'
require './lib/cookbook'
require './lib/pantry'
RSpec.describe CookBook do
  describe '#It2' do
    before :each do
      @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
      @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
      @recipe1 = Recipe.new("Mac and Cheese")
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient1, 4)
      @recipe1.add_ingredient(@ingredient2, 8)
      @recipe2 = Recipe.new("Cheese Burger")
      @cookbook = CookBook.new
    end

    it 'exists' do
      expect(@cookbook).to be_a(CookBook)
      expect(@cookbook.recipes).to eq([])
    end

    it 'can add recipes' do
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)
      expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
    end
  end

  describe 'It3' do
    before :each do
      @pantry = Pantry.new
      @cookbook = CookBook.new
      @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
      @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
      @recipe1 = Recipe.new("Mac and Cheese")
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)
      @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
      @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
      @recipe2 = Recipe.new("Cheese Burger")
      @recipe2.add_ingredient(@ingredient1, 2)
      @recipe2.add_ingredient(@ingredient3, 4)
      @recipe2.add_ingredient(@ingredient4, 1)
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)
    end

    it 'recipes can show total calories' do
      expect(@recipe1.total_calories).to eq(440)
      expect(@recipe2.total_calories).to eq(675)
    end

    it 'can list all ingredients' do
      expect(@cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
    end
  end
end
