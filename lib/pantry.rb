class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient_search)
    # @stock.each do |ingredient|
    # @stock.find {|ingredient| ingredient.name.downcase == ingredient_search.downcase}
    # require 'pry' ; binding.pry
    ###
    # @stock.find do |ingredient|
    #   require 'pry' ; binding.pry
    #   if ingredient[0].downcase == ingredient_search.name.downcase
    #     return ingredient[1]
    #   end
    # end

    ####
    #@stock["Cheese"].name
    @stock[ingredient_search.name]
    # require 'pry' ; binding.pry

  end

  def restock(ingredient_add, amount)
    @stock = {ingredient_add.name => amount}
    # @stock.find do |ingredient|
    #   if ingredient.name.downcase == ingredient_add.downcase

  end
end
