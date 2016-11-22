require 'rails_helper'

RSpec.describe "TrainingSessions", type: :request do
  describe "GET /training_sessions" do
    it "works! (now write some real specs)" do
      get training_sessions_path
      expect(response).to have_http_status(200)
    end
  end
end
