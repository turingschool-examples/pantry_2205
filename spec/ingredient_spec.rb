require './lib/ingredient'

describe Ingredient do
  before(:each) do
    @cheese = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
  end

  it "is an instance of Ingredient" do
    expect(@cheese).to be_a(Ingredient)
  end

  it "has a name" do
    expect(@cheese.name).to eq("Cheese")
  end

  it "has a unit" do
    expect(@cheese.unit).to eq("oz")
  end

  it "has calories" do
    expect(@cheese.calories).to eq(50)
  end
  
end
