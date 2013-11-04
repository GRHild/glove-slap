GloveSlap::Application.routes.draw do

  scope :api do
    post "user/location" => "user#update_location"
    post "user/:user_id/slap" => "slap#create"
    post "slap/:slap_id/accept" => "slap#accept"
    post "slap/:slap_id/reject" => "slap#reject"
    get "user/profile" => "user#show"
<<<<<<< HEAD
    post "user/gravtar" => "user#update_gravtar"
=======

    post "user/notification" => "user#notification"
>>>>>>> 060b3c6894edff840b9d044e06d5f70d24aa2932
  end
end

