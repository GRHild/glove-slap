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

    it "returns the user's record and nearby users" do
      # Create a few users before POSTing
      User.create(phone_id: "Bob", location: nil).id
      User.create(phone_id: "Carl", location: nil).id
      User.create(phone_id: "Dan", location: nil).id

      # Make the post, assign location to phone
      post :update_location, phone_id: "Amy", location: "78705"
      resp = JSON.parse(response.body)

      # Expect a user record
      expect(resp['user']).to_not be_nil
      expect(resp['user']['id']).to_not be_nil
      expect(resp['user']['phone_id']).to eq("Amy")
      expect(resp['user']['location']).to eq("78705")

      # Expect a user record
      expect(resp['nearby_users']).to_not be_nil
      expect(resp['nearby_users'].count).to eq(4)
    end

    it "shows the user info" do
      # user = User.find(3)
    end
  end

end