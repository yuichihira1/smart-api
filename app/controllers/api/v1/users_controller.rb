module Api::V1
	class V1::UsersController < ApplicationController

		def index
	    render json: { status: 200, message: 'Success' }
	   end

		def create
			@user = User.new(user_params)

			if @user.save!
		      render json: @user, serializer: V1::UserSerializer, root: nil
		    else
		      render json: { error: t('user_create_error') }, status: :unprocessable_entity
		    end
		end

		private


		  def user_params
		  	params.require(:user).permit(:name, :mail, :password, :password_confirmation)
		  end
	  end
	end
end
