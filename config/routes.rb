Rails.application.routes.draw do
	root 'static#landing', via: 'get'

	resources :articles, only: [:index, :show, :new, :create]
end
