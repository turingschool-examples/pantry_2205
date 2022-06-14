require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'
require 'pry'
require 'date'

RSpec.describe Recipe do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
  end

  it 'is a CookBook' do
    expect(@cookbook).to be_instance_of CookBook
  end

  it 'has no recipes by default' do
    expect(@cookbook.recipes).to eq []
  end

  it 'can add recipes' do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.recipes).to eq [@recipe1, @recipe2]
  end

  describe 'iteration 3' do
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

    it 'can tell you the total calories in a meal' do
      expect(@cookbook.ingredients).to eq ["Cheese", "Macaroni", "Ground Beef", "Bun"]
    end

    it 'can tell you the meal with the highest calorie' do
      expect(@cookbook.highest_calorie_meal).to eq @recipe2
    end
  end

  describe 'iteration 4' do
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
    end

    it 'can provide a summary with ingredients listed in order of calories' do
      expect(@cookbook.summary).to eq([{
        :name=>"Mac and Cheese",
        :details=> {
          :ingredients =>[{
            :ingredient=>"Macaroni",
            :amount=>"8 oz"
          },
          {
            :ingredient=>"Cheese",
            :amount=>"2 C"
          }],
          :total_calories=> 440
        }
      },{
        :name=>"Burger",
        :details=> {
          :ingredients=>[{
            :ingredient=>"Ground Beef",
            :amount=>"4 oz"
          },
          {
            :ingredient=>"Bun",
            :amount=>"100 g"
          }],
          :total_calories=> 500
        }
      }])
    end

    it 'can return the date the cookbook is created' do
      expect(@cookbook.date).to eq "06-14-2022"
    end
  end
end
