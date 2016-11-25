class CalendarsController < ApplicationController

  def index
  	@user = current_user
    @training_sessions = TrainingSession.all
    @training_session = TrainingSession.where(user_id: current_user.id)
  end

end
