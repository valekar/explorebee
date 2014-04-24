require 'spec_helper'

describe "newsletter_contents/edit" do
  before(:each) do
    @newsletter_content = assign(:newsletter_content, stub_model(NewsletterContent,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit newsletter_content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", newsletter_content_path(@newsletter_content), "post" do
      assert_select "input#newsletter_content_name[name=?]", "newsletter_content[name]"
      assert_select "textarea#newsletter_content_description[name=?]", "newsletter_content[description]"
    end
  end
end
