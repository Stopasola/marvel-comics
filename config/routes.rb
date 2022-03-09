Rails.application.routes.draw do
  devise_for :users, :path => 'user' do
    get '/user/sign_out' => 'devise/sessions#destroy' 
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "home/index"  
  root "home#index"  
  
end
