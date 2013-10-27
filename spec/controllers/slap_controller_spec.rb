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
end