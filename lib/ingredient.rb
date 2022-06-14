class Ingredient

  attr_reader :name

  def initialize(input)
    @name = input[:name]
  end

end
