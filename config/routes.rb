Rails.application.routes.draw do
   scope module: :api, defaults: { format: :json } do
   	namespace :v1 do
   		resources :users, only: [:index, :create, :show]
   		resource :login, only: [:create], controller: :sessions
   		resource :session, only: [:show], controller: :sessions
		end
	end
end


