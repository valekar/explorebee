require 'spec_helper'

describe "feed_backs/new" do
  before(:each) do
    assign(:feed_back, stub_model(FeedBack,
      :email => "MyString",
      :subject => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new feed_back form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", feed_backs_path, "post" do
      assert_select "input#feed_back_email[name=?]", "feed_back[email]"
      assert_select "input#feed_back_subject[name=?]", "feed_back[subject]"
      assert_select "textarea#feed_back_content[name=?]", "feed_back[content]"
    end
  end
end
