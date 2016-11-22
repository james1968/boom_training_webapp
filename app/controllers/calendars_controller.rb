class CalendarsController < ApplicationController

  def index
    @training_sessions = TrainingSession.all
  end

end
