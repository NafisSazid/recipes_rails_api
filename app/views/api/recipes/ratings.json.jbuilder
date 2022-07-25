if @ratings.present?
  json.ratings @ratings do |rating|
    json.id rating.id
    json.score rating.score
    json.created_at rating.created_at
    json.updated_at rating.updated_at
    json.user do
      json.id rating.user.id
      json.email rating.user.email
      json.created_at rating.user.created_at
      json.updated_at rating.user.updated_at
    end
  end
else
  json.error_message @error_message
end
