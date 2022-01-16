# frozen_string_literal: true

class SubjectsController < ApplicationController

  def index
    @title = 'Neural network app | Predictions'

    @subjects = Subject.includes(:user).order(created_at: :desc).paginate(page: params[:page], per_page: 4)
  end

  def student_subjects
    @title = 'Neural network app | My Predictions'

    @subjects = Subject.where(user_id: current_user.id).order(age: :desc).paginate(page: params[:page], per_page: 4)
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @title = 'Neural network app | Will you be successful?'
    @form = SubjectForm.new(Subject.new)
  end

  def create
    @form = SubjectForm.new(Subject.new)
    
    if @form.save_form(subject_params)
      redirect_to subject_path(@form.model.id)
    else 
       render "new"
    end
  end     

  def destroy
    # TODO
  end

  private

   def subject_params
    params.require(:subject).permit(:walc, :dalc, :age).merge(user_id: current_user.id)
  end
end