require 'spec_helper'

describe UserController do
  describe "POST api/user/location" do

    # when a user first visits the app
    it "creates a new user" do
      # Make the post, assign location to phone
      post :update_location, phone_id: "Amy", latitude: 10.1, longitude: -9.1
      # Grab the new user from the database
      user = User.first
      # Make sure that the user's location was updated
      expect(user).to_not be_nil
      expect(user.phone_id).to eq("Amy")
      expect(user.latitude).to eq(10.1)
      expect(user.longitude).to eq(-9.1)
    end

    # when a user revisits the app
    it "updates an existing user's location" do
      # Create user before POSTing
      user_id = User.create(phone_id: "Amy", latitude: nil, longitude: nil).id
      # Make the post, assign location to phone
      post :update_location, phone_id: "Amy", latitude: 10.1, longitude: -9.1
      # Grab the user from the database
      user = User.find(user_id)
      # Make sure that the user's location was updated
      expect(user.latitude).to eq(10.1)
      expect(user.longitude).to eq(-9.1)
    end

    it "returns the user's record and nearby users" do
      # Create a few users before POSTing
      User.create(phone_id: "Bob", latitude: nil, longitude: nil).id
      User.create(phone_id: "Carl", latitude: nil, longitude: nil).id
      User.create(phone_id: "Dan", latitude: nil, longitude: nil).id

      # Make the post, assign location to phone
      post :update_location, phone_id: "Amy", latitude: 50.50, longitude: -100.50
      resp = JSON.parse(response.body)

      # Expect a user record
      expect(resp['user']).to_not be_nil
      expect(resp['user']['id']).to_not be_nil
      expect(resp['user']['phone_id']).to eq("Amy")
      expect(resp['user']['latitude']).to eq(50.50)
      expect(resp['user']['longitude']).to eq(-100.50)

      # Expect a user record
      expect(resp['nearby_users']).to_not be_nil
      expect(resp['nearby_users'].count).to eq(4)
    end

    it "shows the user info" do
      # user = User.find(3)
    end
  end

end