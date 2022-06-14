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

  it 'finds the ingredients of the cookbook' do
    @recipe1 = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100 })
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe2 = Recipe.new("Cheese Burger")
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.ingredients).to eql(["Cheese", "Macaroni", "Ground Beef", "Bun"])
  end

  it 'finds the highest calorie meal' do
    @recipe1 = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100 })
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe2 = Recipe.new("Cheese Burger")
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.highest_calorie_meal).to eql(@recipe2)
  end

  it 'summarizes ingredients in order of calories' do
    @recipe1 = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100 })
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 1})
    @recipe2 = Recipe.new("Burger")
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 100)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.summary).to eql([{:name=>"Mac and Cheese", :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}}, {:name=>"Burger", :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}], :total_calories=>500}}])
  end

  xit 'returns the time the cookbook was created' do
    expect(@cookbook.date).to eql()
  end

end
