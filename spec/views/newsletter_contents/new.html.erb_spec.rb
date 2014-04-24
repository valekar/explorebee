require 'spec_helper'

describe "newsletter_contents/new" do
  before(:each) do
    assign(:newsletter_content, stub_model(NewsletterContent,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new newsletter_content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", newsletter_contents_path, "post" do
      assert_select "input#newsletter_content_name[name=?]", "newsletter_content[name]"
      assert_select "textarea#newsletter_content_description[name=?]", "newsletter_content[description]"
    end
  end
end
