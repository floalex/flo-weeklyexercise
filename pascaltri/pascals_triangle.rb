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

# #20160430 live session
# class Triangle
#   def initialize(levels)
#     @levels = levels
#   end
  
#   def rows
#     rows = [[1]] #rows[0] = [1]
#     (1..(@levels-1)).each do |level|
#       rows[level] = next_row_for(rows[level-1])
#     end
#     rows
#   end
  
#   def next_row_for(current_row)
#     result = []
#     current_row.each_with_index do |number, idx|
#       if idx == 0
#         result << 1
#       else
#         result << number + current_row[idx-1]
#       end
#     end
#     result << 1
#   end
# end