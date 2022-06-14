require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cookbook'

describe CookBook do
  before(:each) do
    @book = CookBook.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @mac_n_cheese = Recipe.new("Mac and Cheese")
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @borger = Recipe.new("Cheese Burger")
  end

  it "has no recipes by default" do
    expect(@book.recipes).to eq([])
  end

  it "can add recipes" do
    @book.add_recipe(@borger)
    @book.add_recipe(@mac_n_cheese)
    expect(@book.recipes).to eq([@borger, @mac_n_cheese])
  end

  it "can tell you all the ingredients" do
    @mac_n_cheese.add_ingredient(@ingredient1, 2)
    @mac_n_cheese.add_ingredient(@ingredient2, 8)
    @borger.add_ingredient(@ingredient1, 2)
    @borger.add_ingredient(@ingredient3, 4)
    @borger.add_ingredient(@ingredient4, 1)
    @book.add_recipe(@borger)
    @book.add_recipe(@mac_n_cheese)
    expect(@book.ingredients).to eq(["Cheese", "Ground Beef", "Bun", "Macaroni"])
  end

end
