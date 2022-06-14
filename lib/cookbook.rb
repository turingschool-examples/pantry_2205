class CookBook

  attr_reader :recipes
  def initialize
    @recipes = [] 
  end

  def add_recipe(recipe)
    @recipes << recipe
    @recipes
  end

  def ingredients
   uniq_names = @recipes.flat_map do |recipe|
      recipe.ingredients_required.map { |ingred| ingred.first.name }
    end
    uniq_names.uniq
  end

  def highest_calorie_meal
   recipes.max_by {|recipe| recipe.total_calories}
  end
end