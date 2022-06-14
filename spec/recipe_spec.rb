require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

describe Recipe do
  before(:each) do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @mac_n_cheese = Recipe.new("Mac and Cheese")
  end

  it "is an instance of recipe" do
    expect(@mac_n_cheese).to be_a(Recipe)
  end

  it "has a name" do
    expect(@mac_n_cheese.name).to eq("Mac and Cheese")
  end

  it "has no ingredients required by default" do
    expect(@mac_n_cheese.ingredients_required).to eq({})
  end

  it "can have ingredients added to it" do
    @mac_n_cheese.add_ingredient(@ingredient1, 2)
    @mac_n_cheese.add_ingredient(@ingredient1, 4)
    @mac_n_cheese.add_ingredient(@ingredient2, 8)
    expect(@mac_n_cheese.ingredients_required).to eq({@ingredient1 => 6,
      @ingredient2 => 8})
  end

  it "can give you the total calories" do
    @mac_n_cheese.add_ingredient(@ingredient1, 4)
    @mac_n_cheese.add_ingredient(@ingredient2, 8)
    expect(@mac_n_cheese.total_calories).to eq(640)
  end
end
