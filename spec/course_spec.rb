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
    expect(course.students).to eq([])
    expect(course.full?).to eq(false)

    student_1 = Student.new({name: "Morgan", age: 21})
    student_2 = Student.new({name: "Jordan", age: 29})
    course.enroll(student1)
    course.enroll(student2)

    expect(course.students.count).to eq(2)
    expect(course.full?).to eq(true)
  end
end