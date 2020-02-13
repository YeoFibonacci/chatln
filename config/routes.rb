Rails.application.routes.draw do
  get 'manager/index'
  resources :classrooms

  resources :matieres
  
  resources :levels 
    resources :courses do
      resources :comments
    end
devise_for :users
resources :users, only: [:show, :edit, :update]
devise_scope :user do  
  get '/users/sign_out' => 'devise/sessions#destroy'     
end
root to: 'home#index'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 # 
 # 
 # 
  get 'home/draft'# pages of tests
end

