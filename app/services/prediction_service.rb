class PredictionService

  attr_reader :age, :dalc, :walc

  def initialize(subject)
    @age = subject.age 
    @dalc = subject.dalc 
    @walc = subject.walc
  end

  def predict
    model = RubyFann::Standard.new(filename: "model.net")
    model.run([age, dalc, walc]).first.round
  end
end