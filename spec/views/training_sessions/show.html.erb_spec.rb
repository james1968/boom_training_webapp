require 'rails_helper'

RSpec.describe "training_sessions/show", type: :view do
  before(:each) do
    @training_session = assign(:training_session, TrainingSession.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
