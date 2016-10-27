Rails.application.routes.draw do

  resources :writing_methods

  resources :grades do
    resources :lessons do
      resources :writing_methods do
        resources :contents
      end
    end
  end

  root 'grades#index'
end
