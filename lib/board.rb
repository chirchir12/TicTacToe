require_relative 'ui.rb'

class Board
  include UserInterface
  attr_accessor :cells, :option, :player_name, :state, :message
end
