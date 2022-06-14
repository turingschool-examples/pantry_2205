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

  describe '#It3' do
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
      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)

    end

    it 'recipes can show total calories' do
      expect(@recipe1.total_calories).to eq(440)
      expect(@recipe2.total_calories).to eq(675)
    end

    it 'can list all ingredients' do
      expect(@cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
    end

    it 'can show highest calorie meal' do
      expect(@cookbook.highest_calorie_meal).to eq(@recipe2)
    end

    it 'can tell if enough ingredients for something' do
      expect(@pantry.enough_ingredients_for?(@recipe1)).to be(false)
      @pantry.restock(@ingredient2, 7)
      expect(@pantry.enough_ingredients_for?(@recipe1)).to be(false)
      @pantry.restock(@ingredient2, 1)
      expect(@pantry.enough_ingredients_for?(@recipe1)).to be(true)
    end
  end

  describe '#It4' do
    before :each do
      @cookbook = CookBook.new
      @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
      @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
      @recipe1 = Recipe.new("Mac and Cheese")
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)
      @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
      @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 1})
      @recipe2 = Recipe.new("Burger")
      @recipe2.add_ingredient(@ingredient3, 4)
      @recipe2.add_ingredient(@ingredient4, 100)
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)
      @expected_sum = [{
        :name=>"Mac and Cheese",
        :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}],
        :total_calories=>440}}, {
        :name=>"Burger",
        :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}],
        :total_calories=>500}}]
    end

    it 'has a date' do
      expect(@cookbook.date).to be_a(String)
      expect(@cookbook.date[0..2]).to eq('06-')
      expect(@cookbook.date[-5..-1]).to eq('-2022')
    end

    it 'has a summary' do
      expect(@cookbook.summary).to eq(@expected_sum)
    end
  end
end
