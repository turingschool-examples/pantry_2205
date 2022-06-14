require './lib/ingredient'
require 'pry'

RSpec.describe Ingredient do
  before :each do
    @ingredient1 = Ingredient.new(
      {
        name: "Cheese",
        unit: "oz",
        calories: 50
        }
      )
  end

  describe '#initialize' do
    it 'it an Ingredient' do
      expect(@ingredient1).to be_a Ingredient
    end

    it 'has a name' do
      expect(@ingredient1.name).to eq 'Cheese'
    end

    it 'has a unit' do
      expect(@ingredient1.unit).to eq 'oz'
    end

    it 'has a count of calories' do
      expect(@ingredient1.calories).to eq 50
    end
  end
end
