Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: 'users/sessions' }

  root 'tests#index'

  resources :tests, only: :index do
    resources :questions, shallow: true, except: [:index], only: :show do
      resources :answers, shallow: true, except: [:index], only: :show
    end
    post :start, on: :member
  end

  resources :test_passages, only: [:show, :update] do
    get :result, on: :member
    resources :gists, shallow: true, only: [:create]
    ##post :gist, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: [:index] do
        resources :answers, shallow: true, except: [:index]
      end
    end
  end
end
