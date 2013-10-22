class UserController < ApplicationController
  def update_location
    @user = User.create(phone_id: params[:id], location: params[:location])
    @nearby_users = User.all
    render :json => @nearby_users.to_json , :status => 200
  end
end
