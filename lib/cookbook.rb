class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredient_names = []
    @recipes.each do |recipe_instance|
      recipe_instance.ingredients_required.keys.each do |ingredient_instance|
        ingredient_names << ingredient_instance.name
      end
    end
    ingredient_names.uniq
  end
end
