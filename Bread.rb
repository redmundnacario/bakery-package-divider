require_relative './service/Pack'
require_relative './service/Price'

class Bread
  attr_reader :pieces, :price_per_pack, :count_per_pack,  :total_price

  include Pack
  include Price

  def initialize(name, pieces, prices = {2 => 2, 1 => 1})
    @name = name
    @pieces = pieces
    @package = [] # output
    @price_per_pack = {}
    @count_per_pack = {}
    @total_price = 0

    pack_list(prices)
  end

  def pack_list(prices = {2 => 2, 1 => 1})
    @prices = prices
    @packs = @prices.keys
  end

end


class VS5 < Bread
  def initialize(pieces, prices = {5 => 8.99, 3 => 6.99})
    super(name = "VS5", pieces, prices)
  end
end

class MB11 < Bread
  def initialize(pieces, prices = {8 => 24.95, 5 => 16.95, 2 => 9.95})
    super(name = "MB11",pieces, prices)
  end
end

class CF < Bread
  def initialize(pieces, prices = {9 => 16.99, 5 => 9.95, 3 => 5.95})
    super(name = "MB11",pieces, prices)
  end
end