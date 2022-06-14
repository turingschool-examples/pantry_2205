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
    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
        ingredient_array << ingredient.name
      end
    end
    ingredient_array.uniq
  end
end
