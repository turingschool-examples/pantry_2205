require 'rspec'
require './lib/ingredient'

RSpec.describe Ingredient do

  pry(main)> require './lib/ingredient'
  # => true

  pry(main)> require './lib/pantry'
  # => true

  pry(main)> ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
  # => #<Ingredient:0x007fe6041273d8...>

  pry(main)> ingredient1.name
  # => "Cheese"

  pry(main)> ingredient1.unit
  # => "oz"

  pry(main)> ingredient1.calories
  # => 50

  pry(main)> ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  # => #<Ingredient:0x007fd88582ed98...>
end
