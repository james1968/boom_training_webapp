class ReviewsController < ApplicationController

  def new
    @training_session = TrainingSession.find(params[:training_session_id])
    @review = Review.new
  end

  def create
    @training_session = TrainingSession.find(params[:training_session_id])
    @review = @training_session.reviews.create(review_params)
    if @review.save
      redirect_to '/'
    else
      if @review.errors[:user]
        redirect_to '/', alert: 'You have already reviewed this restaurant'
      else
        render :new
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:completed, :rating)
  end

end
