require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'
require 'date'
require 'pry'

RSpec.describe Recipe do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
  end

  it 'is a Recipe' do
    expect(@recipe1).to be_instance_of Recipe
  end

  it 'has a name' do
    expect(@recipe1.name).to eq "Mac and Cheese"
  end

  it 'has no ingredients required by default' do
    expect(@recipe1.ingredients_required).to eq({})
  end

  it 'can add ingredients required' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients_required).to eq({
      @ingredient1 => 6,
      @ingredient2 => 8
    })
  end

  it 'can tell you the ingredients required without the amount' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients).to eq [@ingredient1, @ingredient2]
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
    end

    it 'can tell you the total calories in a meal' do
      expect(@recipe1.total_calories).to eq 440
      expect(@recipe2.total_calories).to eq 675
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

   it 'can create an array of ingredients sorted by calroies' do
     expect(@recipe1.simplified_ingredients_by_calorie).to eq [{
       :ingredient=>"Macaroni",
       :amount=>"8 oz"
     },
     {
       :ingredient=>"Cheese",
       :amount=>"2 C"
     }]
   end

   it 'can create a hash of ingrients with the calories and amounts' do
     expect(@recipe1.ingredients_by_calorie_and_amount).to eq({
       @ingredient1 => {calories: 200, amount: 2},
       @ingredient2 => {calories: 240, amount: 8}
       })
   end

   it 'can create a hash of ingredients sorted by calories' do
     expect(@recipe1.ingredients_sorted_by_calorie).to eq({
       @ingredient2 => {calories: 240, amount: 8},
       @ingredient1 => {calories: 200, amount: 2}
       })
   end
 end
end
