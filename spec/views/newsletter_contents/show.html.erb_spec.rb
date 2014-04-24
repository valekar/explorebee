require 'spec_helper'

describe "newsletter_contents/show" do
  before(:each) do
    @newsletter_content = assign(:newsletter_content, stub_model(NewsletterContent,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
