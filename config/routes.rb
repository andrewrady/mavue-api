Rails.application.routes.draw do
  devise_for :users
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :user_token

  namespace :v1 do
    resources :students do
      get 'search', on: :collection
      get 'instructor/search', on: :collection
      resources :sales
      resources :notes
      resources :testing, :controller => "student_testing", only: [:index, :show] 
    end

    resources :head_of_houses do
      get 'search', on: :collection
      scope module: :head_of_houses do
        resources :contracts
      end
    end

    resources :inventory do
      get 'search', on: :collection
    end

    resources :products do
      # resources :subscriptions
    end

    resources :testing
    
    namespace :settings do
      resources :ranks
      resources :programs
      resources :salestaxes
    end
  end
end
