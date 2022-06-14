class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes.append(recipe)
  end

  def ingredients
    @recipes.map do |recipe|
      recipe.ingredients_required.keys.map do |ingredient|
        ingredient.name
      end
    end.flatten.uniq
  end

  def highest_calorie_meal
     @recipes.select.max do |recipe|
      recipe.total_calories
    end
  end

end
