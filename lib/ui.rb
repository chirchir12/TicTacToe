module UserInterface
  def header
    "\n           Its #{next_player.name} (#{next_player.symbol})'s turn \n"
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

  def main_row_two
    "  #{cells['4'][0]} | #{cells['5'][0]} | #{cells['6'][0]} \n"
  end

  def breaker_two
    '   -----------' + '        ' + "-----------\n"
  end

  def aside_row_three
    "    #{cells['7'][1]} | #{cells['8'][1]} | #{cells['9'][1]}        "
  end

  def main_row_three
    "  #{cells['7'][0]} | #{cells['8'][0]} | #{cells['9'][0]} \n"
  end

  def footer
    "\n    Press e to exit, r to restart\n\n"
  end

  def row_one
    aside_row_one + main_row_one + breaker_one
  end

  def row_two
    aside_row_two + main_row_two + breaker_two
  end

  def row_three
    aside_row_three + main_row_three
  end

  def table
    row_one + row_two + row_three
  end

  def ui
    mssg + header + table + footer
  end

  def status_ui
    mssg + table + footer
  end
end
