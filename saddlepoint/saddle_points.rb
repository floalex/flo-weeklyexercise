class Matrix
  
  def initialize(matrix_string)
    @matrix = matrix_string.split("\n")
  end
  
  def rows
    @matrix.map {|group| group.split.map(&:to_i)}
  end
  
  def columns
    row_first, *row_other = *rows 
    row_first.zip(*row_other)
    # alternative: rows.transpose
  end
  
  def saddle_points
    array = []
    (0..(columns[0].size-1)).each do |r_index|
      (0..(rows[0].size-1)).each do |c_index|
        array << [r_index, c_index] if rows[r_index].max == columns[c_index].min
      end
    end
    array
  end
end