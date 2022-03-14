Rails.application.routes.draw do
  devise_for :users, :path => 'user' do
    get '/user/sign_out' => 'devise/sessions#destroy' 
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "home/index"  
  root "home#index"  
  get "search_comic", to: 'characters#search'
  
  post "add_upvote", to: 'upvotes#create'
  delete "delete_upvote", to: 'upvotes#delete'
  
end
