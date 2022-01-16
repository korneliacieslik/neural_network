Rails.application.routes.draw do
  

  devise_for :users, path: '', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users
  root to: "subjects#index"
  resources :subjects
  get :my_predictions, to: 'subjects#student_subjects'
  post :learn_model, to: 'neural_networks#learn_model'
end
