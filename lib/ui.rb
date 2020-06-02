module UserInterface
  def header
    "              #{player_name}\n"
  end

  def mssg
    "  #{message}\n"
  end

  def aside_row_one
    "\n    #{cells['1'][1]} | #{cells['2'][1]} | #{cells['3'][1]}       "
  end
end
