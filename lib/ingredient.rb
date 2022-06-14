class Ingredient

  attr_reader :name,
              :unit,
              :calories

  def initialize(attriubtes)
    @name = attriubtes[:name]
    @unit = attriubtes[:unit]
    @calories = attriubtes[:calories]
  end




end
