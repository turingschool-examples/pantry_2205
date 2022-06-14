class CookBook

  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    req = []
    @recipes.each do |recipe, qty|
      recipe.ingredients_required.each do |ingredient, qty|
        req << ingredient.name
      end
    end
    req.uniq
  end

  def highest_calorie_meal
    rec = @recipes.map { |recipe| recipe.total_calories }.max
      @recipes. each do |recipe|
        if recipe.total_calories == rec
          return recipe
        end
    end
  end

end
