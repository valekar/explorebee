require 'spec_helper'

describe "feed_backs/show" do
  before(:each) do
    @feed_back = assign(:feed_back, stub_model(FeedBack,
      :email => "Email",
      :subject => "Subject",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
  end
end
