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

    # # uses Google Cloud Messaging
  # def notification
  #   # api key generated by google api for Greg's phone and MAC computer
  #   gcm = GCM.new(AIzaSyA9Cig_f9g8I3jL5VVj9Fp_3oZcPnaOn5A)
  #   # registration_id is device_id, id is for Greg's Android phone
  #   registration_ids = ['338DB16ED548E601']
  #   options = {data: {score: '123'}, collapse_key: 'updated_score'}
  #   response = gcm.send_notification(registration_ids, options)
  # end

  # def notification_perform
  #   @list = Redis::List.new(Notification.key_name)
  #   while notification = @list.pop do
  #     notification_json = JSON.parse(notification)

  #       PUSHER.push(note)
  #     if notification_json['platform'] == 'Android'
  #       gcm = GCM.new(ENV['gcm_key'])
  #       registration_id = [notification_json['token']]
  #       options = {
  #         'data' => {
  #           'message' => notification_json['message']
  #         },
  #           'collapse_key' => 'updated_state'
  #       }
  #       response = gcm.send_notification(registration_id, options)
  #     end
  #   end
  # end

  def rank
    # grab all users in the database
    # sort by rank in descending order
    # show only the first 5
    @all_users = User.order(rank: :asc).first(5)
  end
end
