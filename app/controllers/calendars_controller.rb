class CalendarsController < ApplicationController

  def index
  	@user = current_user
    @training_sessions = TrainingSession.all
    
  end

end
