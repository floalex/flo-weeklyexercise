# A small archiving program that stores students' names along with the grade that they are in

# 1. Add a student's name to the roster for a grade => "Add Jim to grade 2."
# 2. Get a list of all students enrolled in a grade 
# 3. Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3, etc., students within a grade should be sorted alphabetically by name.

# class School
  
#   attr_reader :db
#   def initialize
#     @db = Hash.new { |students, grade| students[grade] = [] }
#   end

#   def add(student, grade)
#     db[grade] << student
#   end

#   def grade(num)
#     db[num]
#   end

#   def to_h
#     Hash[sorted_students.sort]
#   end

#   private

#     def sorted_students
#       db.map { |grade, students| [grade, students.sort] }
#     end
# end

# #20150124
# class School
#   def initialize
#     @db = Hash.new
#   end
  
#   def empty?
#     @db.empty?
#   end
  
#   def add(student, grade)
#     @db[grade] = [] unless @db[grade]
#     @db[grade] << student
#   end
  
#   def to_h
#     sorted = @db.map {|key, value| [key, value.sort]}.sort
#     Hash[sorted]
#   end
  
#   def grade(num)
#     @db[num] = [] unless @db[num]
#     @db[num] 
#   end
# end

#20160130
class School
  def initialize
    @roaster = {}
  end
  
  def add(name, grade)
    @roaster[grade] = [] unless @roaster[grade]
    @roaster[grade] << name
  end
  
  def to_h
    result = {}
    @roaster.keys.sort.each do |key|
      result[key] = @roaster[key].sort
    end
    result
  end
  
  def grade(num)
    @roaster[num] = [] unless @roaster[num]
    @roaster[num]
  end
end
