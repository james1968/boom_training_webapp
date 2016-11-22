require 'rails_helper'

RSpec.describe "training_sessions/new", type: :view do
  before(:each) do
    assign(:training_session, TrainingSession.new(
      :name => "MyString"
    ))
  end

  it "renders new training_session form" do
    render

    assert_select "form[action=?][method=?]", training_sessions_path, "post" do

      assert_select "input#training_session_name[name=?]", "training_session[name]"
    end
  end
end
