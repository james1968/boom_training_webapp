require 'rails_helper'

RSpec.describe "training_sessions/edit", type: :view do
  before(:each) do
    @training_session = assign(:training_session, TrainingSession.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit training_session form" do
    render

    assert_select "form[action=?][method=?]", training_session_path(@training_session), "post" do

      assert_select "input#training_session_name[name=?]", "training_session[name]"
    end
  end
end
