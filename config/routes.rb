GloveSlap::Application.routes.draw do
  scope :api do
    post "user/location" => "user#update_location", :as => :location_api
  end
end
