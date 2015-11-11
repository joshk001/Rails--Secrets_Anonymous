class UsersController < ApplicationController
	# before_action :require_login, except: [:create]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

	def index
	end


	def create
		u = User.new(user_params)
		if u.save
			session[:user_id] = u.id
			# render :text => "Its working"
			redirect_to "/users/#{u.id}"
		else
			flash[:errors] = u.errors.full_messages
			redirect_to :back
		end
	end

	def show
		@user = User.find(params[:id])
  		@sec = @user.secrets_liked
		@secret = @user.secrets
		render 'show'
	end




	private
	def user_params
		params.require(:users).permit(:name, :email, :password, :password_confirmation)
	end

	def secret_params
		params.require(:secret).permit(:content)
	end
end
