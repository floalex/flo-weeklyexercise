class Triangle
  attr_reader :rows
  
  def initialize(row_num)
    @rows = pascal(row_num)
  end
  
  def pascal(depth)
    arr = []
    (0..(depth-1)).each do |row|
      arr[row] = []
      (0..row).each do |column|
        if column == 0 || column == row
          arr[row] << 1
        else
          arr[row] << (arr[row-1][column-1] + arr[row-1][column]) # add the two numbers above it in previous row
        end
      end
    end
    arr
  end
  
end