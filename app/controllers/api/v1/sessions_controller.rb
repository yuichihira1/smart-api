module Api::V1
  class API::V1::SessionsController < ApplicationController
  	skip_before_action :authenticate

  	def create
        @user = User.find_for_database_authentication(email: params[:email])
        return invalid_email unless @user

        if @user.valid_password?(params[:password])
          sign_in :user, @user
          render json: @user, serializer: UserSerializer, root: nil
        else
          invalid_password
        end
      end
  end
end
