class FriendRequestsController < ApplicationController
	def new
		@new_user_friend_request = FriendRequest.new
	end

	def create
		friend_request = FriendRequest.create(friend_request_params)
		friend_request.sender = current_user
		if friend_request.save
			redirect_to root_path
		else
			flash[:notice] = "unable to send friend request"
			redirect_to root_path
		end
	end

	private

	def friend_request_params
		params.require(:friend_request).permit(:email)
	end
end
