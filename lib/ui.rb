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

  def main_row_one
    "   #{cells['1'][0]} | #{cells['2'][0]} | #{cells['3'][0]}\n"
  end

  def breaker_one
    ('   -----------' + '        ' + "-----------\n")
  end

  def aside_row_two
    "    #{cells['4'][1]} | #{cells['5'][1]} | #{cells['6'][1]}        "
  end
end
