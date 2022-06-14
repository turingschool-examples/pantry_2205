class CookBook

  attr_reader :recipes
  def initialize
    @recipes = [] 
  end

  def add_recipe(recipe)
    @recipes << recipe
    @recipes
  end
end