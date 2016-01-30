# A small archiving program that stores students' names along with the grade that they are in

# 1. Add a student's name to the roster for a grade => "Add Jim to grade 2."
# 2. Get a list of all students enrolled in a grade 
# 3. Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3, etc., students within a grade should be sorted alphabetically by name.

class School
  
  attr_reader :db
  def initialize
    @db = Hash.new { |students, grade| students[grade] = [] }
  end

  def add(student, grade)
    db[grade] << student
  end

  def grade(num)
    db[num]
  end

  def to_h
    Hash[sorted_students.sort]
  end

  private

    def sorted_students
      db.map { |grade, students| [grade, students.sort] }
    end

end