class CookBook
  attr_reader 

  def initialize
    @recipe_index = []
  end

  def add_recipe(recipe)
    @recipe_index << recipe
  end

  def recipes
    @recipe_index.map { |recipe| recipe.name  }
  end

end
