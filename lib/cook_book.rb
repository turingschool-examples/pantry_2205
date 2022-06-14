class CookBook
  attr_reader :recipes, :date

  def initialize
    @recipes = []
    @date = Date.today.strftime("%m-%e-%Y")
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    list = @recipes.flat_map do |recipe|
      recipe.ingredients_required.map do |ingredient, amount|
        ingredient.name
      end
    end
    list.uniq
  end

  def highest_calorie_meal
    calories_by_meal = {}
    @recipes.each do |recipe|
      calories_by_meal[recipe] = recipe.total_calories
    end
    calories_by_meal.key(calories_by_meal.values.max)
  end

  def summary
    test = @recipes.map do |recipe|
      {
        name: recipe.name,
        details: {ingredients: recipe.simplified_ingredients_by_calorie, total_calories: recipe.total_calories }
      }
    end
  end
end
