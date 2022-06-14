class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(new_recipe)
    @recipes << new_recipe
  end
end
