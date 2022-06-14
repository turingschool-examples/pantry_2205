require "rspec"
require "./lib/ingredient"
require "./lib/pantry"

RSpec.describe Pantry do
	describe "Iteration 2" do
		before :each do
      @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
      @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
      @pantry = Pantry.new
    end

		it "exists" do
			expect(@pantry).to be_a(Pantry)
		end

		it "can start with an empty stock hash" do
			expect(@pantry.stock).to eq({})
    end

    it "can check stock of ingredients (starts at 0)" do
      expect(@pantry.stock_check(@ingredient1)).to eq(0)
    end

    it "can restock ingredients" do
      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)

      expect(@pantry.stock_check(@ingredient1)).to eq(15)
    end
	end
end
