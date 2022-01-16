class SubjectForm < Reform::Form

  property :user_id
  property :age 
  property :walc
  property :dalc 

  validates :user_id, :age, :walc, :dalc, presence: true
  validates :age, numericality: { only_integer: true, less_than_or_equal_to: 26,  greater_than_or_equal_to: 15 }
  validates :dalc, :walc, numericality: { only_integer: true, less_than_or_equal_to: 5,  greater_than_or_equal_to: 1 }

    def save_form(attr = {})
      return unless validate(attr)


      save
      make_prediction
      true
    end


    private

    def make_prediction
      prediction = PredictionService.new(model).predict
      model.update!(success: ::ActiveModel::Type::Boolean.new.cast(prediction))
    end
end