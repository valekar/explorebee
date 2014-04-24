require "spec_helper"

describe NewsletterContentsController do
  describe "routing" do

    it "routes to #index" do
      get("/newsletter_contents").should route_to("newsletter_contents#index")
    end

    it "routes to #new" do
      get("/newsletter_contents/new").should route_to("newsletter_contents#new")
    end

    it "routes to #show" do
      get("/newsletter_contents/1").should route_to("newsletter_contents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/newsletter_contents/1/edit").should route_to("newsletter_contents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/newsletter_contents").should route_to("newsletter_contents#create")
    end

    it "routes to #update" do
      put("/newsletter_contents/1").should route_to("newsletter_contents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/newsletter_contents/1").should route_to("newsletter_contents#destroy", :id => "1")
    end

  end
end
