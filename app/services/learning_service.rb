require 'csv'

class LearningService

  def parse_raw_data_file
    inputs = []
    outputs = []
  
    CSV.foreach("students_data.csv") do |row|
      inputs.push([row[0].to_f, row[1].to_f, row[2].to_f])
      outputs.push([row[4].to_i])
    end

    { inputs: inputs, outputs: outputs }
  end

  def create_model
    data = parse_raw_data_file
    testing_percentage = 20.0
    testing_size = data[:inputs].size * (testing_percentage/100.to_f)
    
    inputs_test_data = data[:inputs][0 .. (testing_size-1)]
    outputs_test_data = data[:outputs][0 .. (testing_size-1)]
  
    inputs_train_data = data[:inputs][testing_size .. data[:inputs].size] 
    outputs_train_data = data[:outputs][testing_size .. data[:outputs].size]
  
    train = RubyFann::TrainData.new(inputs: inputs_train_data, desired_outputs: outputs_train_data)
    model = RubyFann::Standard.new(num_inputs: 3, hidden_neurons: [6], num_outputs: 1)

    model.train_on_data(train, 1000, 10, 0.01)

    predicted = []

    inputs_test_data.each do |params|
      predicted.push( model.run(params).map{ |e| e.round } )
    end

    correct = predicted.collect.with_index { |e,i| (e == outputs_test_data[i]) ? 1 : 0 }.inject{ |sum,e| sum+e }

    model.save('model.net')
  end
end