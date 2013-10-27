class SlapController < ApplicationController

  def create
    # grab the challenger usng phone_id
    @challenger = User.where(phone_id: params[:phone_id]).first
    # grab the target using user_id
    @target = User.where(id: params[:user_id]).first
    # create the Slap record using challenger_id and target_id
    Slap.create(challenger_id: @challenger.id, target_id: @target.id)

    render :json => { status: "ok" }, :status => 200
  end

  def accept
    # Grab the target user by phone_id
    @target = User.where(phone_id: params[:phone_id]).first
    # Grab the slap record by slap_id
    # @slap = Slap.where(id: params[:slap_id]).first
    @slap = Slap.find(params[:slap_id])
    # Compare target_id to target user's phone_id to make sure she's legit
    if @target.id == @slap.target_id
    # Update the slap record's status to "accept"
      @slap.update(status: "accepted")
    end
    render :json => { status: "ok" }, :status => 200
  end

end
