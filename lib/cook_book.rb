class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
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
end
