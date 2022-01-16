class NeuralNetworksController < ApplicationController
  
  def learn_model
    @service = LearningService.new.create_model
    
    redirect_to subjects_path
  end
end