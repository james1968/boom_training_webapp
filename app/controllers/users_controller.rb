class UsersController < ApplicationController
  def show
    @user = current_user
    @training_session = TrainingSession.find(params[:id])
    training_sessions = TrainingSession.where(user_id: current_user.id)
    @completed_sessions_count = TrainingSession.where(training_completed: "Hells YEAH").count
    @failed_sessions_count = TrainingSession.where(training_completed: "Didn't do it").count
    @completed_sessions_count > 0 && @failed_sessions_count > 0 ? @success_rate = (@failed_sessions_count / @completed_sessions_count).to_f * 100 : @success_rate = "N/A"

  end
end
