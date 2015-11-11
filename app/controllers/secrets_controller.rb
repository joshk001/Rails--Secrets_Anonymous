class SecretsController < ApplicationController


  def index
  	@secrets = Secret.all
  end

  def new    #creating new Secret by User
  	@user = User.find(params[:id])
  	s = Secret.new(secret_params)
  	s.update(:user => @user)
  	s.save
  	redirect_to :back
  end

  def destroy
	secret = Secret.find(params[:id])
	secret.destroy
	redirect_to :back
  end

  def show    #displaying Secrets Liked by user
  	@u = User.find(5)
  	@sec = @u.secrets_liked
  	render 'show'
  end




  private
  def secret_params
  	params.require(:secret).permit(:content)
  end


end
