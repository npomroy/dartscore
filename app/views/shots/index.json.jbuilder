json.array!(@shots) do |shot|
  json.extract! shot, :id
  json.url shot_url(shot, format: :json)
end
