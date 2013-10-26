class UserController < ApplicationController
  def update_location
    # create new user with phone_id and location
    if User.where(phone_id: params[:phone_id]).blank?
      @user = User.create(phone_id: params[:phone_id], location: params[:location])
    else
      # find user in the database
      @user = User.where(phone_id: params[:phone_id]).first
      # update to the new location
      @user.update(location: params[:location])
    end

    # find all users in the location
    @nearby_users = User.all

    # returns nearby_users in json
    render :json => @nearby_users.to_json , :status => 200
  end

  def slap
    # grab the challenger usng phone_id
    @challenger = User.where(phone_id: params[:phone_id]).first
    # grab the target using user_id
    @target = User.where(id: params[:user_id]).first
    # create the Slap record using challenger_id and target_id
    puts "Challer: #{@challenger}"
    puts "Target: #{@target}"
    Slap.create(challenger_id: @challenger.id, target_id: @target.id)

    render :json => { status: "ok" }, :status => 200
  end
end
