class CookBook
  attr_reader :recipes, :ingredients, :date

  def initialize
    @recipes = []
    @ingredients = []
    @date = date = Time.now.strftime("%m-%d-%Y")
  end

  def add_recipe(recipe)
    @recipes << recipe
    recipe.ingredients.each do |ingredient|
      @ingredients.include?(ingredient.name) ? nil : @ingredients << ingredient.name
    end
  end

  def highest_calorie_meal
    recipe_cals_hash = {}
    @recipes.each { |recipe| recipe_cals_hash[recipe] = recipe.total_calories }
    max = recipe_cals_hash.max_by { |recipe, cals| cals }
    max[0]
  end

  def summary
    summary = []
    @recipes.each do |recipe|
      summary << {
        name: recipe.name,
        details: {ingredients: ingredients_for_summary(recipe), total_calories: recipe.total_calories}
    }
    end
    summary
  end

  def ingredients_for_summary(recipe)
    array = []
    sorted = recipe.ingredients_required.sort_by do |ingredient, amount|
      -(ingredient.calories * amount)
    end.to_h
    sorted.map do |ingredient, amount|
      array << {
        ingredient: ingredient.name,
        amount: "#{amount} #{ingredient.unit}"
      }
    end
    array
  end
end
