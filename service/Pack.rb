module Pack
  
  def get_packs
    loop_divide
    if @package.length > 0
      for i in @packs
        count = @package.count(i)
        next if count == 0
        @count_per_pack[i] = count if count != 0
      end
    end
  end

  def initialize_counter
    #initialize counter back to start or  0
    @ctr1 = 0
  end

  def loop_divide
    # loops the package list by removing the first entry if output package length is 0 in a loop
    initialize_counter

    for i in (0...@packs.length).to_a
      @temp_packs = @packs[i..]
      @temp_pieces = @pieces
      divide()
      return @package if @package.length > 0
    end
  end

  def divide
    # main divider function
    @temp_package = []
    @temp_pieces_local = @temp_pieces # duplicat the duplicate

    scenario1
    get_qoutient_and_remainder
    scenario2

    divide_based_on_pack
    jump_next_pack
  end

  def get_qoutient_and_remainder
    # gets quotient and remainder
    @result = @temp_pieces_local / @temp_packs[@ctr1]
    @remainder = @temp_pieces_local % @temp_packs[@ctr1]
  end

  def scenario1
    # will jump to the next pack list in loop divide() if counter exceeds package list in divide()
    if @ctr1 >= @temp_packs.length 
      initialize_counter
      @package = []
      return
    end
  end

  def scenario2
    # if remainder is less than minimum package. This will help to divide 11 pieces for VS5 with pack list [5,3]
    if @remainder < @packs.min && @remainder > 0 && @packs.max == @temp_packs[@ctr1]
      @result = @result - 1
    end
  end

  def divide_based_on_pack
    # if pieces are 10 and the pack is 5 from pack list, then 10 will be divided by 5 into 2
    # if scenario1 is passed, proceed to this... scenario 2 is optional
    for i in (1..@result).to_a 
      @temp_package = @temp_package.append(@temp_packs[@ctr1])
      @temp_pieces_local = @temp_pieces_local - @temp_packs[@ctr1]
    end
  end

  def jump_next_pack
    # jump next pack in pack_list if pieces is 0 (all pieces were packed) 
    # else, do the divide() again/recursively with the next pack in the pack list until pieces are 0
    if @temp_pieces_local == 0 # return package
      @package = @package + @temp_package
    else
      @temp_packs[1...].each_with_index do |i, index|
        if @temp_pieces_local % i == 0
          @package = @package + @temp_package
          @temp_pieces = @temp_pieces_local
          @ctr1 = index + 1
          divide()
        end
      end
    end
  end
  
end