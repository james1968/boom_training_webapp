class TrainingSessionsController < ApplicationController

  before_action :set_training_session, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @training_sessions = TrainingSession.all
  end

  def show
  end

  def new
    @training_session = TrainingSession.new params[:training_session] ? training_session_params : {}
  end

  def edit
    @training_session = current_user.training_sessions.where(id: params[:id]).first
  end

  def join_session
    training_session = TrainingSession.find(params[:id])
    training_session.users << current_user if !current_user.belongs_to_training_session(training_session)
    redirect_to training_session_path(training_session)
  end

  def create
    @training_session = current_user.training_sessions.build(training_session_params)
    current_user.training_sessions << @training_session

    
      if @training_session.save
        Text.new.send_text(current_user.mobile_number, "You have successfully created a training session for #{@training_session.name} on #{@training_session.start_time.strftime("%d of %B")} at #{@training_session.start_time.strftime("%H%M")}") if current_user.has_mobile_number?
        completed_email(current_user, "HELL YEAH! You completed #{@training_session.name} on #{@training_session.start_time.strftime("%d of %B")} at #{@training_session.start_time.strftime("%H%M")}")
        flash[:notice] = "You successfully created a training session"
        redirect_to user_training_session_path(current_user, @training_session)
      else
        format.html { render :new }
        format.json { render json: @training_session.errors, status: :unprocessable_entity }
      end
    
  end

  def update
    respond_to do |format|
      if @training_session.update(training_session_params)
        format.html { redirect_to @training_session, notice: 'Training session was successfully updated.' }
        format.json { render :show, status: :ok, location: @training_session }
      else
        format.html { render :edit }
        format.json { render json: @training_session.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @training_session.destroy
    respond_to do |format|
      format.html { redirect_to training_sessions_url, notice: 'Training session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_training_session
      @training_session = TrainingSession.find(params[:id])
    end

    def training_session_params
      params.require(:training_session).permit(:name, :start_time, :training_completed)
    end

    def completed_email(current_user, body)
      if @training_session.training_completed == "Hells YEAH"
        Email.send_email(current_user, body)
      end
    end
end
