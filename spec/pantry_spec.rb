require './lib/pantry'

RSpec.describe Pantry do
  before :each do
    @ingredient1 = Ingredient.new(
      { name: 'Cheese',
        unit: 'oz',
        calories: 50
      }
    )
    @ingredient2 = Ingredient.new(
      { name: 'Macaroni',
        unit: 'oz',
        calories: 200
      }
    )
    @pantry = Pantry.new
  end

  describe '#initialize' do
    it 'is a Pantry' do
      expect(@pantry).to be_a Pantry
    end

    it 'initializes with an empty hash of stock' do
      expect(@pantry.stock).to eq ({})
    end
  end

  describe '#stock_check' do
    it 'returns the quantity of an ingredient in the stock hash' do
      expect(@pantry.stock_check(@ingredient1)).to eq 0
      @pantry.restock(@ingredient1, 5)
      expect(@pantry.stock_check(@ingredient1)).to eq 5
    end
  end

  describe '#restock' do
    it 'adds a specific ingredient and quantity to the stock hash' do
      expect(@pantry.stock).to eq ({})
      @pantry.restock(@ingredient1, 5)
      expect(@pantry.stock).to eq ({ @ingredient1 => 5})
      @pantry.restock(@ingredient1, 10)
      expect(@pantry.stock).to eq ({ @ingredient1 => 15})
      @pantry.restock(@ingredient2, 7)
      expect(@pantry.stock).to eq ({ @ingredient1 => 15, @ingredient2 => 7})
    end
  end
end
