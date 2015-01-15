Rails.application.routes.draw do

  resources :subjects do |s|
    member do
      get :activate
      get :deactivate
    end
    resources :groups do |g|
      resources :instructor_answers
      resources :posts do |p|
        resources :discussions
      end
    end
    resources :topics
  end
  root to: 'subjects#index'
  devise_for :users
  resources :users

end
