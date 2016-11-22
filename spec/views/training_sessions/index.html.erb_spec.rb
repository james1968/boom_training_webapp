require 'rails_helper'

RSpec.describe "training_sessions/index", type: :view do
  before(:each) do
    assign(:training_sessions, [
      TrainingSession.create!(
        :name => "Name"
      ),
      TrainingSession.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of training_sessions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
