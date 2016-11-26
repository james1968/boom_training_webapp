class CalendarsController < ApplicationController
  def index
  	@user = current_user if current_user 
    @training_sessions = @user.training_sessions if @user
  end
end
