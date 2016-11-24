class FriendshipsController < ApplicationController
	def new
		@friendship = Friendship.new
	end

	def create
		friendship = Friendship.create(first_user_email: params[:user_id], second_user_email: params[:second_user_email])
		print friendship.first_user
		print friendship.second_user
		if friendship.save
			redirect_to root_path
		else
			flash[:notice] = "unable to add friend"
			redirect_to root_path
		end
	end

	private

	def friendship_params
		params.require(:friendship).permit(:second_user_email)
	end
end
