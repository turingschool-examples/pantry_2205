class Ingredient
  attr_reader :name, :unit, :calories

  def initialize(argument)
    @name = argument[:name]
    @unit = argument[:unit]
    @calories = argument[:calories]
  end
end
