class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new {|hash, key| hash[key] = 0}
  end

  def stock_check(ingredient)
    @stock.keys.count == 0 ? 0 : @stock.each do |item, amount|
      if item == ingredient
        return amount
      end
    end
  end

  def restock(item, amount)
    @stock[item] += amount
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.each { |ingredient, amount|
      return false if @stock.include?(ingredient) == false
      @stock.each {|item, quantity|
        if ingredient == item
          return false if quantity < amount
        end
      }}
    return true
  end

end
