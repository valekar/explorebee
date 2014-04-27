require 'spec_helper'

describe "feed_backs/edit" do
  before(:each) do
    @feed_back = assign(:feed_back, stub_model(FeedBack,
      :email => "MyString",
      :subject => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit feed_back form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", feed_back_path(@feed_back), "post" do
      assert_select "input#feed_back_email[name=?]", "feed_back[email]"
      assert_select "input#feed_back_subject[name=?]", "feed_back[subject]"
      assert_select "textarea#feed_back_content[name=?]", "feed_back[content]"
    end
  end
end
