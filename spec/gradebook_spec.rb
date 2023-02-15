require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe Gradebook do
  before(:each) do
    @gradebook = Gradebook.new
    @course_1 = Course.new("Baking", 2)
    @course_2 = Course.new("Juggling", 3)
    @student_1 = Student.new({name: "A", age: 11})
    @student_1.log_score(100)
    @student_1.log_score(90)
    @student_2 = Student.new({name: "B", age: 22})
    @student_2.log_score(90)
    @student_2.log_score(80)
    @student_3 = Student.new({name: "C", age: 33})
    @student_3.log_score(80)
    @student_3.log_score(70)
    @student_4 = Student.new({name: "D", age: 44})
    @student_4.log_score(70)
    @student_4.log_score(60)
    @student_5 = Student.new({name: "E", age: 55})
    @student_5.log_score(60)
    @student_5.log_score(50)
    @course_1.enroll(@student_1)
    @course_1.enroll(@student_2)
    @course_2.enroll(@student_3)
    @course_2.enroll(@student_4)
    @course_2.enroll(@student_5)

    @gradebook.add_course(@course_1)
    @gradebook.add_course(@course_2)
  end

  it "exists" do
    expect(@gradebook).to be_a(Gradebook)
    expect(@gradebook.courses).to eq([@course_1, @course_2])
  end

  it "can list all students in courses" do
    expect(@gradebook.list_all_students).to be_a(Hash)
    expect(@gradebook.list_all_students[@course_1]).to be_a(Array)
    expect(@gradebook.list_all_students[@course_1].count).to eq(2)
  end

  it "can list students below grade threshold" do
    expect(@gradebook.students_below(70).count).to eq(2)
    expect(@gradebook.students_below(70)[0]).to eq(@student_4)
    expect(@gradebook.students_below(70)[1]).to eq(@student_5)
  end

  it "can track all grades across all courses" do
    expect(@gradebook.all_grades).to be_a(Hash)
    expect(@gradebook.all_grades[@course_1]).to eq([95.0, 85.0])
    expect(@gradebook.all_grades[@course_2]).to eq([75.0, 65.0, 55.0])
  end

  it "can return all students within a certain grade range" do
    expect(@gradebook.students_in_range(60, 80)).to eq([@student_3, @student_4])
  end

end