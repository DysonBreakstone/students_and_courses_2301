require './lib/student'

RSPEC.describe Student do
  before(:each) do
    student = Student.new({name: "Morgan", age: 21})
  end

  it "exists" do
    expect(student).to be_a(Student)
  end
  
  it "has a name" do
    expect(student.name).to eq("Morgan")
  end

  it "has the correct age attribute") do
    expect(student.age).to eq(21)
  end

  it "possesses a scores attribute and log_score method and average score" do
    expect(student.scores).to eq([])

    student.log_score(89)
    student.log_score(78)

    expect(student.scores).to eq([89,78])
    expect(student.grade).to eq(83.5)
    end
end
