class LikesController < ApplicationController

  def show  #shows the number of LIKES
  	@secrets = Secret.find(params[:id])
  end

  def create  #LIKE the secret
  	secret = Secret.find(params[:secret_id])
  	like = Like.create(user_id: current_user.id, secret_id: secret.id)
  	redirect_to :back
  end

  def destroy  #UNLIKE the Like
  	like = Like.find(params[:id])
  	like.destroy
  	redirect_to :back
  end

end
