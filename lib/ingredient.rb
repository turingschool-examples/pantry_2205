class Ingredient
  attr_reader :name, :unit, :calories
  def initialize(nutrition)
    @name = nutrition[:name]
    @unit = nutrition[:unit]
    @calories = nutrition[:calories]
  end
end
