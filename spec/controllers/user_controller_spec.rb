require 'spec_helper'

describe UserController do
  describe "POST api/user/location" do
    it "updates the user's location" do
      # Create user before POSTing
      user_id = User.create(phone_id: "Amy", location: nil).id
      # Make the post
      post :update_location, phone_id: "Amy", location: "78705"
      # Grab the user from the database
      user = User.find(user_id)
      # Make sure that the user's location was updated
      expect(user.location).to eq("78705")
    end
  end
end