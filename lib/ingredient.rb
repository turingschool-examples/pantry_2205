class Ingredient
  attr_reader :name, :unit, :calories
  def initialize(item)
    @name = item[:name]
    @unit = item[:unit]
    @calories = item[:calories]
  end
end
