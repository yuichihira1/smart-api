Rails.application.routes.draw do
   scope module: :api, defaults: { format: :json } do
   	namespace :v1 do
   		resources :users, only: [:index, :create, :show]
		end
	end
end


