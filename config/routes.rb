GloveSlap::Application.routes.draw do
  scope :api do
    post "user/location" => "user#update_location"
    post "user/:user_id/slap" => "slap#create"
    post "slap/:slap_id/accept" => "slap#accept"
    post "slap/:slap_id/reject" => "slap#reject"
    get  "user/profile" => "user#show"
    post "user/:user_id/gravatar" => "user#update_gravatar"
    post "leaderboard" => "user#rank"
    post "user/pendingslaps" => "slap#index"
    post "user/notification" => "user#notification"
  end
end

