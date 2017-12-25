module API::V1
  class API::V1::SessionsController < ApplicationController
  	skip_before_action :authenticate


  	def create
        @user = User.find_by(email: params[:email])
        if @user = nil
          render json: { error: t('user_session_error') }, status: :unprocessable_entity
        else
          render json: @user, serializer: UserSerializer, root: nil
         end
      end
    end
end
