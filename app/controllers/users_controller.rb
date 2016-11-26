class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @training_sessions = @user.training_sessions
    @completed_sessions_count = @user.completed_training_sessions.count
    @failed_sessions_count = @user.failed_training_sessions.count
    @success_rate = @user.success_rate
  end

  
end
