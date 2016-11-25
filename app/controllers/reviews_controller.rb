class ReviewsController < ApplicationController

  def new
    @training_session = TrainingSession.find(params[:training_session_id])
    @review = Review.new
  end

  def create
    @training_session = TrainingSession.find(params[:training_session_id])
    @training_session.reviews.create(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:completed, :rating)
  end

end
