class Board
  def initialize
    @grid = Array.new(3) { Array.new(3) }
  end

  def display
    @grid.each_with_index do |row, index|
      mapped_row = row.map { |cell| cell.nil? ? ' ' : cell }
      puts mapped_row.join(" | ")

      if index == 0 || index == 1
        puts '---------'
      end
    end
  end
end
