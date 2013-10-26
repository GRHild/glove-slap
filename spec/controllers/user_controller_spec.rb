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

    it "renders nearby users" do
      # Create user before POSTing
      # user_id = User.create(phone_id: "Amy", location: nil).id
      # Make the post, assign location to phone
      post :update_location, phone_id: "Amy", location: "78705"
      puts response.body
      # Grab the user from the database
      # user = User.find(user_id)
      # Make sure that the user's location was updated
      # expect(user.location).to eq("78705")
    end
  end

  describe "POST user/:user_id/slap" do

    it "create a new Slap record" do
      # Create the challenger
      user = User.create(phone_id: "Amy", location: "32456")
      # Create the user that Amy will target
      target = User.create(phone_id: "Bryant", location: "54323")
      # Make the post pointing to the target's id
      post :slap, phone_id: "Amy", user_id: target.id
      # Make sure the Slap was created
      slap = Slap.where(challenger_id: user.id, target_id: target.id).first
      expect(slap).to_not be_nil
      expect(slap.target_id).to eq(target.id)
      expect(slap.challenger_id).to eq(user.id)
    end
  end
end