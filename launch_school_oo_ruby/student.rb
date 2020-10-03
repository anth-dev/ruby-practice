class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end

end

bob = Student.new("Bob", 99)
joe = Student.new("Joe", 80)

puts "Well done!" if bob.better_grade_than?(joe)
