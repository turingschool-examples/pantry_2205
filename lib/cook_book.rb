class CookBook

  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredients = []
    @recipes.each do |recipe|
      recipe.ingredients_required.each do |ingredient, amount|
      ingredients << ingredient.name
    end
  end
    ingredients.uniq
  end

  # I know this is not a great method, but I needed to move on and come back to refactor sort_by???
  def highest_calorie_meal
    meal = []
    @recipes.each do |recipe|
      if recipe.total_calories > 500
        meal << recipe
      end
    end
    meal[0]
  end


end
