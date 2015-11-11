class SessionsController < ApplicationController

	def create
		user = User.find_by(email: session_params[:email])

		if user && user.authenticate(session_params[:password])
			session[:user_id] = user.id
			# render :text => "Logged In"
			redirect_to "/users/#{user.id}"
		else
			flash[:errors] = ["Invalid Credentials"]
			redirect_to :back
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/users'
	end



	private
	def session_params
		params.require(:sessions).permit(:email, :password)
	end
end
