class Recipe
  attr_reader :name, :ingredients_required
  
  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end
end
