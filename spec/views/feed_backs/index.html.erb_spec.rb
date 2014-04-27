require 'spec_helper'

describe "feed_backs/index" do
  before(:each) do
    assign(:feed_backs, [
      stub_model(FeedBack,
        :email => "Email",
        :subject => "Subject",
        :content => "MyText"
      ),
      stub_model(FeedBack,
        :email => "Email",
        :subject => "Subject",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of feed_backs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
