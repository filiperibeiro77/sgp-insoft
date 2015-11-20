require 'spec_helper'

describe "feedbacks/edit" do
  before(:each) do
    @feedback = assign(:feedback, stub_model(Feedback,
      :subject => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit feedback form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", feedback_path(@feedback), "post" do
      assert_select "input#feedback_subject[name=?]", "feedback[subject]"
      assert_select "textarea#feedback_content[name=?]", "feedback[content]"
    end
  end
end
