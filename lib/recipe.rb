require './lib/ingredient'
require './lib/pantry'

class Recipe

  attr_reader :name

  def initialize(name)
    @name = name
  end

end
