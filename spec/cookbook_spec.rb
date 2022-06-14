require './lib/recipe'
require './lib/cookbook'
require './lib/ingredient'

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

	describe 'Iteration 3' do
		it 'can return the ingredients' do
			cookbook = CookBook.new
			recipe1 = Recipe.new("Mac and Cheese")
			recipe2 = Recipe.new("Cheese Burger")
			ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
			ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
			ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
			ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

			recipe1.add_ingredient(ingredient1, 2)
			recipe1.add_ingredient(ingredient2, 8)
			recipe2.add_ingredient(ingredient1, 2)
			recipe2.add_ingredient(ingredient3, 4)
			recipe2.add_ingredient(ingredient4, 1)
			cookbook.add_recipe(recipe1)
			cookbook.add_recipe(recipe2)


			expect(cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
		end

		it 'can return a hash of recipes by calories' do
			cookbook = CookBook.new
			recipe1 = Recipe.new("Mac and Cheese")
			recipe2 = Recipe.new("Cheese Burger")
			ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
			ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
			ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
			ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

			recipe1.add_ingredient(ingredient1, 2)
			recipe1.add_ingredient(ingredient2, 8)
			recipe2.add_ingredient(ingredient1, 2)
			recipe2.add_ingredient(ingredient3, 4)
			recipe2.add_ingredient(ingredient4, 1)
			cookbook.add_recipe(recipe1)
			cookbook.add_recipe(recipe2)

			expect(cookbook.recipe_by_calories).to be_a(Hash)
			expect(cookbook.recipe_by_calories.keys[0]).to eq(recipe1)
			expect(cookbook.recipe_by_calories.values[0]).to eq(440)
			expect(cookbook.recipe_by_calories.keys[1]).to eq(recipe2)
			expect(cookbook.recipe_by_calories.values[1]).to eq(675)
		end

		it 'can return the highest calorie meal' do
			cookbook = CookBook.new
			recipe1 = Recipe.new("Mac and Cheese")
			recipe2 = Recipe.new("Cheese Burger")
			ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
			ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
			ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
			ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

			recipe1.add_ingredient(ingredient1, 2)
			recipe1.add_ingredient(ingredient2, 8)
			recipe2.add_ingredient(ingredient1, 2)
			recipe2.add_ingredient(ingredient3, 4)
			recipe2.add_ingredient(ingredient4, 1)
			cookbook.add_recipe(recipe1)
			cookbook.add_recipe(recipe2)


			expect(cookbook.highest_calorie_meal).to eq(recipe2)
		end

	end

end
