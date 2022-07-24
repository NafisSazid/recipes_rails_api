json.rating do
  json.id @rating.id
  json.created_at @rating.created_at
  json.updated_at @rating.updated_at
  json.score @rating.score

  json.user do
    json.id @rating.user.id
    json.email @rating.user.email
  end
end
