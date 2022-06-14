class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.flat_map do |recipe|
      recipe.ingredients_required.keys.map do |ingredient|
        ingredient.name
      end
    end.uniq
  end

  def highest_calorie_meal
    highest_calories = @recipes.map {|recipe| recipe.total_calories}.max
    @recipes.find {|recipe| recipe.total_calories == highest_calories}
  end

end
