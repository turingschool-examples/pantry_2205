class Ingredient
  attr_reader :name,
              :unit,
              :calories
  def initialize(qualities)
    @name = qualities[:name]
    @unit = qualities[:unit]
    @calories = qualities[:calories]
  end
end
