class FriendshipsController < ApplicationController

	def index
		@user = current_user
		@friends = current_user.friends
	end

	def new
		@friendship = Friendship.new
	end

	def create
		friendship = Friendship.create(first_user_id: current_user.id, second_user_id: User.where(email: params[:friendship][:second_user_id]).ids.first)

		if friendship.save
			flash[:notice] = "Friend added"
			redirect_to root_path
		else
			flash[:notice] = "Unable to create friendship"
			redirect_to root_path
		end
	end

	def show
		@friendship = Friendship.find(params[:id])
	end

	def friendship_params
		params.require(:friendship).permit(:email)
	end
end
