Rails.application.routes.draw do

  resources :writing_methods

  resources :grades do
    resources :lessons
  end

  resources :lessons do
    resources :contents
  end

  resources :contents

  root 'grades#index'

  namespace :api do
    namespace :v1 do
      get 'grades' => 'grades#index'
      get 'grades/:grade_id/lessons' => 'lessons#index'
      get 'writing_methods' => 'writing_methods#index'
      get 'lessons/:lesson_id/contents' => 'contents#index'
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
