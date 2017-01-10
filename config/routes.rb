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
end
