Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'forms#home'
get 'about', to: 'forms#about'
resources :contacts
get 'contact-us', to: 'contacts#new'

end
