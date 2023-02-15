class Student

  attr_reader :name, :age, :scores

  def initialize(info_hash)
    @name = info_hash[:name]
    @age = info_hash[:age]
    @scores = []
  end

  def log_score(new_score)
    @scores << new_score
  end

  def grade
    @scores.sum.to_f / @scores.count.to_f
  end

end
