GloveSlap::Application.routes.draw do
  scope :api do
    post "user/location" => "user#update_location"
    post "user/:user_id/slap" => "user#slap"
  end
end
