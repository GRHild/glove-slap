json.array!(@players) do |player|
  json.extract! player, :name, :email, :login
  json.url player_url(player, format: :json)
end
