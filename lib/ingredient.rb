class Ingredient

  attr_reader :name,
              :unit,
              :calories

  def initialize(input)
    @name = input[:name]
    @unit = input[:unit]
    @calories = input[:calories]
  end

end
