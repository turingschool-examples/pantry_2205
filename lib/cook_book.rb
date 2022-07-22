require 'time'
class CookBook
  attr_reader :recipes, :date

  def initialize
    @recipes = []
    @date = Date.today.strftime('%m-%d-%Y')
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredient_array = []
     @recipes.flat_map do |recipe|
       recipe.ingredients.map do |ingredient|
         ingredient_array.push(ingredient.name) if !ingredient_array.include?(ingredient.name)
       end
     end
     ingredient_array
  end

  def highest_calorie_meal
    @recipes.max { |recipe| recipe.total_calories }
  end

  def summary
    answer = []
    recipes.each do |recipe|
      answer << recipe_hash(recipe)
    end
    answer
  end

  def recipe_hash(recipe)
    recipe_hash = {}
    recipe_hash[:name] = recipe.name
    recipe_hash[:details] = {}
    recipe_hash[:details][:ingredients] = []
    recipe.ingredients_by_calories.each do |ingredient, qty|
      hash = {ingredient: ingredient.name,
              amount: qty.to_s + " " + ingredient.unit
              }
    recipe_hash[:details][:ingredients] << hash
    end
    recipe_hash[:details][:total_calories] = recipe.total_calories
    recipe_hash
  end
end
