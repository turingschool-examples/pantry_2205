require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

end
