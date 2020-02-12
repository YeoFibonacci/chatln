Rails.application.routes.draw do
  resources :matieres
  resources :levels
  resources :classrooms
  resources :comments

	resources :courses do
	  resources :comments
	end
	 
devise_for :users
devise_scope :user do  
  get '/users/sign_out' => 'devise/sessions#destroy'     
end
  root to:'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
