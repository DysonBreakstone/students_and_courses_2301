class Gradebook
  attr_reader :courses

  def initialize
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    student_hash = Hash.new("Course doesn't exist")
    @courses.each do |course|
      student_hash[course] = course.students
    end
    student_hash
  end

  def students_below(threshold)
    struggling_students = []
    @courses.each do |course|
      course.students.each do |student|
        struggling_students << student if student.grade < threshold
      end
    end
    struggling_students
  end

  def all_grades
  end

  def students_in_range(low, high)
    goldilocks_students = []
    @courses.each do |course|
      course.students.each do |student|
        goldilocks_students << student if student.grade >= low && student.grade <= high
      end
    end
    goldilocks_students
  end
end
