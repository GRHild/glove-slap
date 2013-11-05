class UserController < ApplicationController
  def update_location
    # create new user with phone_id and location
    if User.where(phone_id: params[:phone_id]).blank?
      @user = User.create(phone_id: params[:phone_id], latitude: params[:latitude], longitude: params[:longitude])
    else
      # find user in the database
      @user = User.where(phone_id: params[:phone_id]).first
      # update to the new location
      @user.update(latitude: params[:latitude], longitude: params[:longitude])
    end

    # find nearby users in the location
    @nearby_users = User.near([@user.latitude, @user.longitude], 0.1)

    # returns nearby_users in json
    render :json => { :nearby_users => @nearby_users, :user => @user }, :status => 200
  end

  def show
    # show all the users with nickname, ranks,
    @user = User.find_by(params[:id])

    render :json => @user.to_json , :status => 200
  end

  def update_gravatar
    @user = User.find_by(id: params[:user_id])

    if params[:email].present?
      @user.update(email: params[:email].downcase)
    end

    render :json => @user.to_json , :status => 200
  end
end
