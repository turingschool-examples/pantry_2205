require_relative 'ingredient'
require_relative 'pantry'
require_relative 'recipe'


class CookBook
  attr_accessor :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end


end
