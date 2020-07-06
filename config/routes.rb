Rails.application.routes.draw do
	devise_for :users
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root to: 'forms#home'
	get 'about', to: 'forms#about'
	resources :contacts, only: :create
	get 'contact-us', to: 'contacts#new', as: 'new_contact'

end
