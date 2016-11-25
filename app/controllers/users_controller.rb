class UsersController < ApplicationController
  def show
    @user = current_user
    @training_session = TrainingSession.find(params[:id])
  end
end
