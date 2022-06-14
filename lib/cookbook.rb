class CookBook
  attr_reader :recipes
  def initialize
     @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    items = []
    @recipes.each {|recipe| recipe.ingredients.each {|ingredient| items << ingredient.name}}
    items.uniq
  end
end
