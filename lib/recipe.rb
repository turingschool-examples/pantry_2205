class Recipe
  attr_reader :name,
              :ingredients_required


  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)

  end

  def add_ingredient(item, amount)
    @ingredients_required[item] += amount
  end

  def ingredients
    @ingredients_required.keys
  end

end
