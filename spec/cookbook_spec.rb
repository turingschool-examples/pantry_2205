require './lib/recipe'
require './lib/cookbook'

RSpec.describe CookBook do
	describe 'Iteration 2' do
		it 'exists' do
			cookbook = CookBook.new

			expect(cookbook).to be_an_instance_of(CookBook)
		end

		it 'can return the recipes contained (if any)' do
			cookbook = CookBook.new

			expect(cookbook.recipes).to eq([])
		end

		it 'can add recipes to itself' do
			cookbook = CookBook.new
			recipe1 = Recipe.new("Mac and Cheese")
			recipe2 = Recipe.new("Cheese Burger")

			cookbook.add_recipe(recipe1)
			cookbook.add_recipe(recipe2)

			expect(cookbook.recipes).to eq([recipe1, recipe2])

		end
 	end
end
