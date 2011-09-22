Knowman::Application.routes.draw do
	resources :people

	resources :projects

	resources :companies

	devise_for :users do
		get "sign_out", :to => "devise/sessions#destroy"
	end

	resources :topics  
	resources :folders do
			resources :topics do 
				get "all"
			resources :updates
			end
	end
	match '/userupdate', :to => 'updates#userupdate'
	root :to => 'dashboard#index'

end
