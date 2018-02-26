Rails.application.routes.draw do
  devise_for :users
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :user_token

  namespace :v1 do
    resources :students do
      get 'search', on: :collection
      resources :sales
    end
    # get 'students/search/:name' => 'student_controller#search'
    resources :inventory
  end
end
