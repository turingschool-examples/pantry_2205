class Ingredient

  attr_reader :name,
              :unit

  def initialize(input)
    @name = input[:name]
    @unit = input[:unit]
  end

end
