json.extract! profile, :id, :birth_place, :birth_date, :nickname, :living_place, :gender, :gender_identity, :sexuality, :created_at, :updated_at
json.url profile_url(profile, format: :json)
