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

  def update_grid(row, column, value)
    @grid[row][column] = value
  end

  def winner
    check_rows || check_columns || check_diagonals
  end

  def draw?
    !@grid.flatten.include?(nil) && winner.nil?
  end

  private

  def check_grid_lines(grid)
    grid.each do |row|
      if !row[0].nil? && row.all? { |element| element == row[0]}
        return row[0]
      end
    end
    nil
  end

  def check_rows
    check_grid_lines(@grid)
  end

  def check_columns
    check_grid_lines(@grid.transpose)
  end

  def check_diagonals
    diagonal1 = [@grid[0][0], @grid[1][1], @grid[2][2]]
    diagonal2 = [@grid[0][2], @grid[1][1], @grid[2][1]]

    check_grid_lines([diagonal1, diagonal2])
  end
end
