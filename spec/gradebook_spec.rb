require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe Gradebook do
  before(:each) do
    @gradebook = Gradebook.new
    @course_1 = Course.new("Baking", 2)
    @course_2 = Course.new("Juggling", 3)
    @student_1 = Student.new("A", 11)
    @student_1.log_score(100)
    @student_1.log_score(90)
    @student_2 = Student.new("B", 22)
    @student_2.log_score(90)
    @student_2.log_score(80)
    @student_3 = Student.new("C", 33)
    @student_3.log_score(80)
    @student_3.log_score(70)
    @student_4 = Student.new("D", 44)
    @student_4.log_score(70)
    @student_4.log_score(60)
    @student_5 = Student.new("E", 55)
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
    expect(@gradebook.courses).to eq(["Baking","Juggling"])
  end

  it "can list all students in courses" do
    expect(@gradebook.list_all_students).to eq({"Baking" => ["A", "B"] "Juggling" => ["C", "D", "E"]})
  end

  it "can list students below grade threshold" do
    expect(@gradebook.students_below(70).count).to eq(2)
    expect(@gradebook.students_below(70)[0].name).to eq("D")
    expect(@gradebook.students_below(70)[1].name).to eq("E")
  end

end