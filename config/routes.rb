Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  	root to: "home#index"
  	get '/add' => 'posts#post'
	get '/added' => 'posts#create'
	get '/edit' => 'posts#edit'
	get '/edited' => 'posts#update'
	get '/delete' => 'posts#delete'
	get '/deleted' => 'posts#destroy'
end
