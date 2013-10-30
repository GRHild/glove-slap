require 'spec_helper'

describe SlapController do
  describe "POST user/:user_id/slap" do

    it "create a new Slap record" do
      # Create the challenger
      user = User.create(phone_id: "Amy", location: "32456")
      # Create the user that Amy will target
      target = User.create(phone_id: "Bryant", location: "54323")
      # Make the post pointing to the target's id
      post :create, phone_id: "Amy", user_id: target.id
      # Make sure the Slap was created
      slap = Slap.where(challenger_id: user.id, target_id: target.id).first
      expect(slap).to_not be_nil
      expect(slap.status).to eq("pending")
      expect(slap.target_id).to eq(target.id)
      expect(slap.challenger_id).to eq(user.id)
    end
  end

  describe "POST slap/:slap_id/accept" do

    it "updates the Slap record's status to 'accepted'" do
      # Create the challenger
      user = User.create(phone_id: "Amy", location: "32456")
      # Create the user that Amy will target
      target = User.create(phone_id: "Bryant", location: "54323")
      # Create a new slap record
      slap = Slap.create(challenger_id: user.id, target_id: target.id)

      # Make the post pointing to the target's id
      post :accept, phone_id: "Bryant", slap_id: slap.id
      # Make sure the Slap was updated
      slap = Slap.where(challenger_id: user.id, target_id: target.id).first

      expect(slap).to_not be_nil
      expect(slap.status).to eq("accepted")
      expect(slap.target_id).to eq(target.id)
      expect(slap.challenger_id).to eq(user.id)
    end

    it "does not allow a user to accept a slap they were not offered" do
      # Create the challenger
      user = User.create(phone_id: "Amy", location: "32456")
      # Create the user that Amy will target
      target = User.create(phone_id: "Bryant", location: "54323")
      # Create a new slap record
      slap = Slap.create(challenger_id: user.id, target_id: target.id)

      # Create the malicious user
      bad_guy = User.create(phone_id: "BadGuy", location: "???")

      # Make the post using the malicious user's phone id
      post :accept, phone_id: "BadGuy", slap_id: slap.id
      # Make sure the Slap was NOT updated
      slap = Slap.where(challenger_id: user.id, target_id: target.id).first

      expect(slap).to_not be_nil
      expect(slap.status).to eq("pending")
      expect(slap.target_id).to eq(target.id)
      expect(slap.challenger_id).to eq(user.id)
    end
  end

  describe "POST slap/:slap_id/reject" do
    it "updates the Slap record's status to 'rejected'" do
      # Create the challenger
      user = User.create(phone_id: "Amy", location: "32456")
      # Create the user that Amy will target
      target = User.create(phone_id: "Bryant", location: "54323")
      # Create a new slap record
      slap = Slap.create(challenger_id: user.id, target_id: target.id)

      # Make the post pointing to the target's id
      post :reject, phone_id: "Bryant", slap_id: slap.id
      # Make sure the Slap was updated
      slap = Slap.where(challenger_id: user.id, target_id: target.id).first

      expect(slap).to_not be_nil
      expect(slap.status).to eq("rejected")
      expect(slap.target_id).to eq(target.id)
      expect(slap.challenger_id).to eq(user.id)
    end
  end
end