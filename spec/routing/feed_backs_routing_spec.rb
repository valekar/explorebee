require "spec_helper"

describe FeedBacksController do
  describe "routing" do

    it "routes to #index" do
      get("/feed_backs").should route_to("feed_backs#index")
    end

    it "routes to #new" do
      get("/feed_backs/new").should route_to("feed_backs#new")
    end

    it "routes to #show" do
      get("/feed_backs/1").should route_to("feed_backs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/feed_backs/1/edit").should route_to("feed_backs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/feed_backs").should route_to("feed_backs#create")
    end

    it "routes to #update" do
      put("/feed_backs/1").should route_to("feed_backs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/feed_backs/1").should route_to("feed_backs#destroy", :id => "1")
    end

  end
end
