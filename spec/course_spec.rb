require './lib/course'
require './lib/student'

RSpec.describe Course do
  before(:each) do
    @course = Course.new("Calculus", 2)
  end

  it "exists" do
    expect(@course).to be_a(Course)
  end

  it "has a name and capacity" do
    expect(@course.name).to eq("Calculus")
    expect(@course.capacity).to eq(2)
  end

  it "has an array of students which can be enrolled, and can fill course" do
    expect(@course.students).to eq([])
    expect(@course.full?).to eq(false)

    student_1 = Student.new({name: "Morgan", age: 21})
    student_2 = Student.new({name: "Jordan", age: 29})
    @course.enroll(student_1)
    @course.enroll(student_2)

    expect(@course.students.count).to eq(2)
    expect(@course.full?).to eq(true)
  end

  it "cannot enroll more students than capacity" do
    student_1 = Student.new({name: "Morgan", age: 21})
    student_2 = Student.new({name: "Jordan", age: 29})
    student_3 = Student.new({name: "Petunia", age: 93})
    @course.enroll(student_1)
    @course.enroll(student_2)
    @course.enroll(student_3)
    
    expect(@course.students.count).to eq(2)
  end
end