module Price

  def compute_price_per_pack
    @count_per_pack.each do | pack, count |
      @price_per_pack[pack] = (@prices[pack] * count).round(2)
    end
  end

  def compute_total_price
    @price_per_pack.each do | item, price |
      @total_price = (@total_price + price).round(2)
    end
  end
  
end