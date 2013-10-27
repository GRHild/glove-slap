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

  def update
    ;
  end

end
