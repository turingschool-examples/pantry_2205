require 'rspec'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'
require 'date'

RSpec.describe CookBook do

  before(:each) do
    @ingredient1 = Ingredient.new({
      name: "Cheese",
      unit: "C",
      calories: 100})

    @ingredient2 = Ingredient.new({
      name: "Macaroni",
      unit: "oz",
      calories: 30})

    @ingredient3 = Ingredient.new({
      name: "Ground Beef",
      unit: "oz",
      calories: 100})

    @ingredient4 = Ingredient.new({
      name: "Bun",
      unit: "g",
      calories: 1})

    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Burger")

    @cookbook = CookBook.new
  end

  it 'exists' do
    expect(@cookbook).to be_instance_of(CookBook)
  end

  it 'initializes with empty array of recipes' do
    expect(@cookbook.recipes).to eq([])
  end

  it 'can add recipes' do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expect(@cookbook.recipes).to eq([@recipe1,@recipe2])
  end

  it 'returns highest calorie meal' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)

    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expect(@cookbook.highest_calorie_meal).to eq(@recipe2)
  end

  it 'returns date' do
    allow(@cookbook).to receive(:date).and_return("06-14-2022")

    expect(@cookbook.date).to eq("06-14-2022")
  end

  it 'returns summary' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 100)

    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expect(@cookbook.summary).to eq(
      [{:name=>"Mac and Cheese",
        :details=>
          {:ingredients=>
            [{:ingredient=>"Macaroni",
              :amount=>"8 oz"}, {:ingredient=>"Cheese",
              :amount=>"2 C"}],
          :total_calories=>440}
        },
      {:name=>"Burger",
        :details=>
          {:ingredients=>
            [{:ingredient=>"Ground Beef",
              :amount=>"4 oz"},
              {:ingredient=>"Bun",
                :amount=>"100 g"}],
        :total_calories=>500}
        }]
      )
  end

end
