class UsersController < ApplicationController
  def show
    @user = current_user
    training_sessions = TrainingSession.where(user_id: current_user.id)
    @completed_sessions_count = TrainingSession.where(training_completed: "Hells YEAH").count
    @failed_sessions_count = TrainingSession.where(training_completed: "Didn't do it").count
    @success_rate = (@failed_sessions_count / @completed_sessions_count ).to_f * 100
  end
end
