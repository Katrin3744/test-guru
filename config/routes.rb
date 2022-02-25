Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tests#index'
  get :login, to: 'sessions#new'
  get :signup, to: 'users#new'

  resources :users, only: :create
  resources :sessions, only: [:create, :destroy]

  resources :tests do
    resources :questions, shallow: true, except: [:index] do
      resources :answers, shallow: true, except: [:index]
    end
    post :start, on: :member
  end

  resources :test_passages, only: [:show, :update] do
    get :result, on: :member
  end
end
