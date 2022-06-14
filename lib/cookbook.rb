class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    all_ing = []
    @recipes.each do |recipe|
      all_ing << recipe.ingredients
    end
    all_ing.flatten.map(&:name).uniq
  end

  # def highest_calorie_meal
  # 
  # end

end
