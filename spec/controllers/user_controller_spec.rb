require 'spec_helper'

describe UserController do
  describe "POST api/user/location" do

    # when a user first visits the app

    it "creates a new user" do
      # Make the post, assign location to phone
      post :update_location, phone_id: "Amy", location: "78705"
      # Grab the new user from the database
      user = User.first
      # Make sure that the user's location was updated
      expect(user).to_not be_nil
      expect(user.phone_id).to eq("Amy")
      expect(user.location).to eq("78705")
    end

    # when a user revisits the app

    it "updates an existing user's location" do
      # Create user before POSTing
      user_id = User.create(phone_id: "Amy", location: nil).id
      # Make the post, assign location to phone
      post :update_location, phone_id: "Amy", location: "78705"
      # Grab the user from the database
      user = User.find(user_id)
      # Make sure that the user's location was updated
      expect(user.location).to eq("78705")
    end
  end
end