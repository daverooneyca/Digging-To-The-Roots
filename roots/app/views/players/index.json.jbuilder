json.array!(@players) do |player|
  json.extract! player, :id, :username, :name, :age, :city, :country
  json.url player_url(player, format: :json)
end
