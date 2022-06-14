class Ingredient
  attr_reader :name, :unit
  attr_accessor :calories

  def initialize(attributes)
    @name = attributes[:name]
    @unit = attributes[:unit]
    @calories = attributes[:calories]

  end

end
