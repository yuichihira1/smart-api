module API::V1
	class API::V1::UsersController < ApplicationController
		skip_before_action :authenticate, only: [:index, :create]

		def index
	    render json: { status: 200, message: 'Success' }
	   end

		def create
			@user = User.new(user_params)

			if @user.save!
		      render json: @user, serializer: UserSerializer, root: nil
		    else
		      render json: { error: t('user_create_error') }, status: :unprocessable_entity
		    end
		end

	private


	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end
	end
end
